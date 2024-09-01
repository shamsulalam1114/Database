SET SERVEROUTPUT ON;

DECLARE
    v_flatno VARCHAR2(20);
    v_totalexpense NUMBER;

BEGIN
    FOR flat_rec IN (SELECT DISTINCT FLATNO FROM management.EXPENSES)
    LOOP
        v_flatno := flat_rec.FLATNO;

        SELECT NVL(SUM(DUE), 0) + NVL(SUM(GASBILL), 0) + NVL(SUM(ELECTRICITYBILL), 0) +
               NVL(SUM(RENT), 0) + NVL(SUM(MAINTENANCEFEE), 0)
        INTO v_totalexpense
        FROM management.EXPENSES
        WHERE FLATNO = v_flatno;

        UPDATE management.EXPENSES
        SET TOTALEXPENSE = v_totalexpense
        WHERE FLATNO = v_flatno;
        
        DBMS_OUTPUT.PUT_LINE('Total Expense calculated and updated successfully for Flat Number ' || v_flatno);
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
