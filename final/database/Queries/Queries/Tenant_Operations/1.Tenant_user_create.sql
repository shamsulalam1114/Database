SET SERVEROUTPUT ON;
SET VERIFY OFF;
ACCEPT flatno NUMBER PROMPT 'Enter FLATNO: '

DECLARE
    v_flatno NUMBER;
    v_username VARCHAR2(50);
    v_password VARCHAR2(50);

BEGIN
    v_flatno := &flatno;

    SELECT NID, FIRSTNAME
    INTO v_username, v_password
    FROM TENANT
    WHERE FLATNO = v_flatno;

    v_username := 'U' || v_username;

    EXECUTE IMMEDIATE 'CREATE USER ' || v_username || ' IDENTIFIED BY ' || v_password;

    EXECUTE IMMEDIATE 'GRANT CONNECT TO ' || v_username;

    DBMS_OUTPUT.PUT_LINE('User created successfully.');
    DBMS_OUTPUT.PUT_LINE('Username: ' || v_username);
    DBMS_OUTPUT.PUT_LINE('Password: ' || v_password);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for FLATNO ' || v_flatno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
