SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT username CHAR PROMPT 'Enter Username: '

DECLARE
    v_username VARCHAR2(30);
    v_role_name VARCHAR2(50);
    v_view_name_payment VARCHAR2(50);
    v_view_name_edit_info VARCHAR2(50);

BEGIN
    v_username := UPPER('&username');

    v_role_name := 'EDIT_ROLE_' || v_username;

    v_view_name_payment := 'payment_view_' || v_username;
    v_view_name_edit_info := 'edit_info_view_' || v_username;

    EXECUTE IMMEDIATE 'CREATE ROLE ' || v_role_name;

    EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE ON ' || v_view_name_payment || ' TO ' || v_role_name;

    EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE ON ' || v_view_name_edit_info || ' TO ' || v_role_name;

    DBMS_OUTPUT.PUT_LINE('Role ' || v_role_name || ' created and privileges granted successfully for Username ' || v_username);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Username ' || v_username);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
