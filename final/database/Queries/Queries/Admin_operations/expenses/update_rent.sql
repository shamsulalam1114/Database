SET SERVEROUTPUT ON;

ACCEPT flatno CHAR PROMPT 'Enter Flat Number: '
ACCEPT new_rent NUMBER PROMPT 'Enter New Rent Amount: '

DECLARE
    v_flatno VARCHAR2(20);
    v_new_rent NUMBER;

BEGIN
    v_flatno := UPPER(TRIM(TO_CHAR('&flatno')));
    v_new_rent := TO_NUMBER('&new_rent');

    UPDATE management.EXPENSES
    SET RENT = v_new_rent
    WHERE FLATNO = v_flatno;

    DBMS_OUTPUT.PUT_LINE('Rent updated successfully for Flat Number ' || v_flatno);
    COMMIT; 
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Flat Number ' || v_flatno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK; 
END;
/
