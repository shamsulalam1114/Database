SET SERVEROUTPUT ON;

DECLARE
    v_flatno VARCHAR2(20);
    v_expenses_totalexpense NUMBER;
BEGIN
    FOR flat_rec IN (SELECT DISTINCT FLATNO FROM MANAGEMENT.EXPENSES)
    LOOP
        v_flatno := flat_rec.FLATNO;

        SELECT TOTALEXPENSE
        INTO v_expenses_totalexpense
        FROM MANAGEMENT.EXPENSES
        WHERE FLATNO = v_flatno;

        UPDATE MANAGEMENT.DUES
        SET TOTALEXPENSE = v_expenses_totalexpense
        WHERE FLATNO = v_flatno;

        DBMS_OUTPUT.PUT_LINE('Total Expense updated successfully for Flat Number ' || v_flatno);
    END LOOP;

    COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK; 
END;
/
