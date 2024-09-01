SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT username CHAR PROMPT 'Enter Username: '
ACCEPT payment_amount NUMBER PROMPT 'Enter Payment Amount: '

DECLARE
   v_username VARCHAR2(100);
   v_payment_amount NUMBER;
   v_view_name VARCHAR2(100);
BEGIN
   v_username := UPPER('&username');
   v_payment_amount := TO_NUMBER('&payment_amount');
   v_view_name := 'PAYMENT_VIEW_' || v_username;

   EXECUTE IMMEDIATE '
      UPDATE MANAGEMENT.' || v_view_name || '
      SET PAYMENT = :v_payment_amount' USING v_payment_amount;
   COMMIT;
DBMS_OUTPUT.PUT_LINE('Payment information updated successfully for Username ' || v_username);
   
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No data found for Username ' || v_username);
   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/