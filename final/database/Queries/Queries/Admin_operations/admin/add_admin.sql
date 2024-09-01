SET SERVEROUTPUT ON;

ACCEPT admin_id NUMBER PROMPT 'Enter Admin ID: ';
ACCEPT first_name CHAR PROMPT 'Enter First Name: ';
ACCEPT last_name CHAR PROMPT 'Enter Last Name: ';
ACCEPT phone_number CHAR PROMPT 'Enter Phone Number: ';

DECLARE
    v_adminid NUMBER := &admin_id;
    v_firstname VARCHAR2(50) := '&first_name';
    v_lastname VARCHAR2(50) := '&last_name';
    v_phonenumber VARCHAR2(20) := '&phone_number';
BEGIN
    INSERT INTO management.ADMIN (AdminID, FirstName, LastName, PhoneNumber)
    VALUES (v_adminid, v_firstname, v_lastname, v_phonenumber);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Admin added successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Failed to add admin: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
