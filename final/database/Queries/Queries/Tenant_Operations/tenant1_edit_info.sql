SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT username CHAR PROMPT 'Enter Username: '
ACCEPT phonenumber CHAR PROMPT 'Enter Phone Number: '
ACCEPT firstname CHAR PROMPT 'Enter First Name: '
ACCEPT lastname CHAR PROMPT 'Enter Last Name: '

DECLARE
   v_username VARCHAR2(100);
   v_phonenumber VARCHAR2(20);
   v_firstname VARCHAR2(50);
   v_lastname VARCHAR2(50);
   v_view_name VARCHAR2(100);
BEGIN
   v_username := UPPER('&username');
   v_phonenumber := '&phonenumber';
   v_firstname := '&firstname';
   v_lastname := '&lastname';
   v_view_name := 'EDIT_INFO_VIEW_' || v_username;

   EXECUTE IMMEDIATE '
      UPDATE MANAGEMENT.' || v_view_name || '
      SET phonenumber = :v_phonenumber,
          firstname = :v_firstname,
          lastname = :v_lastname' USING v_phonenumber, v_firstname, v_lastname;
    COMMIT;
DBMS_OUTPUT.PUT_LINE('User information updated successfully for Username ' || v_username);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found for Username ' || v_username);
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' - ' || SQLERRM);
END;
/