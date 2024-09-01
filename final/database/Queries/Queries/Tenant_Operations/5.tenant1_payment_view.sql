
SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT username CHAR PROMPT 'Enter Username: '

DECLARE
    v_username VARCHAR2(30);
    v_nid NUMBER;
    v_flatno NUMBER;
    v_view_name VARCHAR2(50);

BEGIN
    v_username := UPPER('&username');

    v_nid := TO_NUMBER(SUBSTR(v_username, 2));

    SELECT FLATNO
    INTO v_flatno
    FROM TENANT
    WHERE NID = v_nid;

    v_view_name := 'PAYMENT_VIEW_' || v_username;

    EXECUTE IMMEDIATE '
        CREATE OR REPLACE VIEW ' || v_view_name || ' AS
        SELECT
            payment
        FROM
            dues
        WHERE
            flatno = ' || v_flatno;

    DBMS_OUTPUT.PUT_LINE('View ' || v_view_name || ' created successfully for Username ' || v_username);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Username ' || v_username);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/

