SET SERVEROUTPUT ON;

ACCEPT national_id CHAR PROMPT 'Enter National ID to update: ';
ACCEPT new_phone_number CHAR PROMPT 'Enter new Phone Number: ';
ACCEPT new_first_name CHAR PROMPT 'Enter new First Name: ';
ACCEPT new_last_name CHAR PROMPT 'Enter new Last Name: ';

DECLARE
    v_nid VARCHAR2(20) := '&national_id';
    v_phonenumber VARCHAR2(20) := '&new_phone_number';
    v_firstname VARCHAR2(50) := '&new_first_name';
    v_lastname VARCHAR2(50) := '&new_last_name';
BEGIN
    UPDATE management.TENANT
    SET PhoneNumber = v_phonenumber, FirstName = v_firstname, LastName = v_lastname
    WHERE NID = v_nid;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tenant information updated successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Failed to update tenant information: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
