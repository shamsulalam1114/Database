
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT username CHAR PROMPT 'Enter Username: '

DECLARE
    v_username VARCHAR2(30);
    v_role_name_edit VARCHAR2(50);
    v_role_name_view VARCHAR2(50);

BEGIN
    v_username := UPPER('&username');

    v_role_name_edit := 'EDIT_ROLE_' || v_username;
    v_role_name_view := 'VIEW_ROLE_' || v_username;

    EXECUTE IMMEDIATE 'GRANT ' || v_role_name_edit || ' TO ' || v_username;

    EXECUTE IMMEDIATE 'GRANT ' || v_role_name_view || ' TO ' || v_username;

    DBMS_OUTPUT.PUT_LINE('Roles granted successfully to Username ' || v_username);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Username ' || v_username);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
