SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT admin_id NUMBER PROMPT 'Enter Admin ID: '

DECLARE
    v_admin_id NUMBER;
    v_username VARCHAR2(50);
    v_password VARCHAR2(50);

BEGIN
    v_admin_id := &admin_id;

    SELECT ADMINID, PHONENUMBER
    INTO v_admin_id, v_password
    FROM ADMIN
    WHERE ADMINID = v_admin_id;

    v_username := 'A' || v_admin_id;

    EXECUTE IMMEDIATE 'CREATE USER ' || v_username || ' IDENTIFIED BY "' || v_password || '"';


    EXECUTE IMMEDIATE 'GRANT DBA TO ' || v_username;

    DBMS_OUTPUT.PUT_LINE('User created successfully.');
    DBMS_OUTPUT.PUT_LINE('Username: ' || v_username);
    DBMS_OUTPUT.PUT_LINE('Password: ' || v_password);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Admin ID ' || v_admin_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
