SET SERVEROUTPUT ON;

ACCEPT new_gasbill NUMBER PROMPT 'Enter New Gas Bill Amount: '

DECLARE
    v_new_gasbill NUMBER;

BEGIN
    v_new_gasbill := TO_NUMBER('&new_gasbill');

    UPDATE management.EXPENSES
    SET GASBILL = v_new_gasbill;

    DBMS_OUTPUT.PUT_LINE('Gas Bill updated successfully for all flats.');
    COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
