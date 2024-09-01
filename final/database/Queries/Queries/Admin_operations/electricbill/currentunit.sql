SET SERVEROUTPUT ON;

ACCEPT flatno CHAR PROMPT 'Enter Flat Number: '
ACCEPT new_currentunit NUMBER PROMPT 'Enter New Current Unit: '

DECLARE
    v_flatno VARCHAR2(20);
    v_new_currentunit NUMBER;
    v_previousunit NUMBER;
    v_perunitcost NUMBER;
    v_electricitybill NUMBER;

BEGIN
    v_flatno := UPPER(TRIM(TO_CHAR('&flatno')));
    v_new_currentunit := TO_NUMBER('&new_currentunit');

    SELECT CURRENTUNIT, PERUNITCOST
    INTO v_previousunit, v_perunitcost
    FROM management.ELECTRICBILL
    WHERE FLATNO = v_flatno;

    v_electricitybill := (v_new_currentunit - v_previousunit) * v_perunitcost;

    UPDATE management.ELECTRICBILL
    SET PREVIOUSUNIT = v_previousunit,
        CURRENTUNIT = v_new_currentunit,
        ELECTRICITYBILL = v_electricitybill
    WHERE FLATNO = v_flatno;

    DBMS_OUTPUT.PUT_LINE('Electricity Bill updated successfully for Flat Number ' || v_flatno);
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Flat Number ' || v_flatno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
