SET SERVEROUTPUT ON;

ACCEPT admin_id NUMBER PROMPT 'Enter Admin ID to remove: ';

DECLARE
    v_adminid NUMBER := &admin_id;
BEGIN
    DELETE FROM management.ADMIN
    WHERE AdminID = v_adminid;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Admin removed successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Failed to remove admin: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
