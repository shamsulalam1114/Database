SET SERVEROUTPUT ON;

ACCEPT new_maintenancefee NUMBER PROMPT 'Enter New Maintenance Fee Amount: '

DECLARE
    v_new_maintenancefee NUMBER;

BEGIN
    v_new_maintenancefee := TO_NUMBER('&new_maintenancefee');

    UPDATE management.EXPENSES
    SET MAINTENANCEFEE = v_new_maintenancefee;

    DBMS_OUTPUT.PUT_LINE('Maintenance Fee updated successfully for all flats.');
    COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
