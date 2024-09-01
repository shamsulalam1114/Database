SET SERVEROUTPUT ON;

ACCEPT new_perunitcost NUMBER PROMPT 'Enter New Per Unit Cost: '

DECLARE
    v_new_perunitcost NUMBER;

BEGIN
    v_new_perunitcost := TO_NUMBER('&new_perunitcost');

    UPDATE management.ELECTRICBILL
    SET PERUNITCOST = v_new_perunitcost;

    DBMS_OUTPUT.PUT_LINE('Per Unit Cost updated successfully for all flats.');
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
