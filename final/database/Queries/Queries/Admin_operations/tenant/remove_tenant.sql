SET SERVEROUTPUT ON;

ACCEPT national_id CHAR PROMPT 'Enter National ID to remove: ';

DECLARE
    v_nid VARCHAR2(20) := '&national_id';
BEGIN
    DELETE FROM management.TENANT
    WHERE NID = v_nid;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tenant removed successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Failed to remove tenant: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
