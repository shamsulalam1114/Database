SET SERVEROUTPUT ON;

ACCEPT flatno CHAR PROMPT 'Enter Flat Number: '

DECLARE
    v_flatno VARCHAR2(20);

BEGIN
    v_flatno := UPPER(TRIM(TO_CHAR('&flatno')));

    UPDATE management.DUES
    SET DUE = TOTALEXPENSE + DUE - PAYMENT,
        PAYMENT = 0
    WHERE FLATNO = v_flatno;

    DBMS_OUTPUT.PUT_LINE('DUE & Payment updated successfully for Flat Number ' || v_flatno);
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Flat Number ' || v_flatno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/
