SET SERVEROUTPUT ON;

ACCEPT admin_id NUMBER PROMPT 'Enter Admin ID to update: ';
ACCEPT new_first_name CHAR PROMPT 'Enter new First Name: ';
ACCEPT new_last_name CHAR PROMPT 'Enter new Last Name: ';
ACCEPT new_phone_number CHAR PROMPT 'Enter new Phone Number: ';

DECLARE
    v_adminid NUMBER := &admin_id;
    v_firstname VARCHAR2(50) := '&new_first_name';
    v_lastname VARCHAR2(50) := '&new_last_name';
    v_phonenumber VARCHAR2(20) := '&new_phone_number';
BEGIN
    UPDATE management.ADMIN
    SET FirstName = v_firstname, LastName = v_lastname, PhoneNumber = v_phonenumber
    WHERE AdminID = v_adminid;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Admin information updated successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Failed to update admin information: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
