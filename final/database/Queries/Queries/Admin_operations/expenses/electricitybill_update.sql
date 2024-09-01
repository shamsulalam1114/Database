SET SERVEROUTPUT ON;

DECLARE
    v_flatno VARCHAR2(20);
    v_electricitybill NUMBER;
BEGIN
    FOR flat_rec IN (SELECT DISTINCT FLATNO FROM management.EXPENSES)
    LOOP
        v_flatno := flat_rec.FLATNO;

        SELECT ELECTRICITYBILL
        INTO v_electricitybill
        FROM management.ELECTRICBILL
        WHERE FLATNO = v_flatno;

        UPDATE management.EXPENSES
        SET ELECTRICITYBILL = v_electricitybill
        WHERE FLATNO = v_flatno;
        
        DBMS_OUTPUT.PUT_LINE('Electricity Bill updated successfully for Flat Number ' || v_flatno);
    END LOOP;

    COMMIT; 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK; 
END;
/
