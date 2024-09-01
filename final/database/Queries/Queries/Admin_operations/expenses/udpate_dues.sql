SET SERVEROUTPUT ON;

ACCEPT flatno CHAR PROMPT 'Enter Flat Number: '
ACCEPT new_due NUMBER PROMPT 'Enter New Due Amount: '

DECLARE
    v_flatno VARCHAR2(20);
    v_new_due NUMBER;

BEGIN
    v_flatno := UPPER(TRIM(TO_CHAR('&flatno')));
    v_new_due := TO_NUMBER('&new_due');

    UPDATE management.EXPENSES
    SET DUE = v_new_due
    WHERE FLATNO = v_flatno;

    DBMS_OUTPUT.PUT_LINE('Due updated successfully for Flat Number ' || v_flatno);
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Flat Number ' || v_flatno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
