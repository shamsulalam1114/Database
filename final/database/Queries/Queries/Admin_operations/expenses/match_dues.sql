SET SERVEROUTPUT ON;

DECLARE
    v_flatno VARCHAR2(20);
    v_due NUMBER;

BEGIN
    FOR flat_rec IN (SELECT DISTINCT FLATNO FROM management.EXPENSES)
    LOOP
        v_flatno := flat_rec.FLATNO;

        SELECT DUE
        INTO v_due
        FROM management.DUES
        WHERE FLATNO = v_flatno;

        UPDATE management.EXPENSES
        SET DUE = v_due
        WHERE FLATNO = v_flatno;
        
        DBMS_OUTPUT.PUT_LINE('Dues updated successfully for Flat Number ' || v_flatno);
    END LOOP;

    COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
