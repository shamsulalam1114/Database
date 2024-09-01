
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT username CHAR PROMPT 'Enter Username: '

DECLARE
    v_username VARCHAR2(30);
    v_role_name VARCHAR2(30);
    v_view_name VARCHAR2(30);
BEGIN
    v_username := UPPER('&username');

    v_role_name := 'view_role_' || v_username;
    EXECUTE IMMEDIATE 'CREATE ROLE ' || v_role_name;

    v_view_name := 'VIEW_' || v_username ;

    EXECUTE IMMEDIATE 'GRANT SELECT ON ' || v_view_name || ' TO ' || v_role_name;

    DBMS_OUTPUT.PUT_LINE('Role ' || v_role_name || ' created and SELECT privilege granted on ' || v_view_name);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
