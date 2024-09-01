SET SERVEROUTPUT ON;

ACCEPT national_id CHAR PROMPT 'Enter National ID: ';
ACCEPT flat_number NUMBER PROMPT 'Enter Flat Number: ';
ACCEPT phone_number CHAR PROMPT 'Enter Phone Number: ';
ACCEPT first_name CHAR PROMPT 'Enter First Name: ';
ACCEPT last_name CHAR PROMPT 'Enter Last Name: ';

DECLARE
    v_nid VARCHAR2(20) := '&national_id';
    v_flatno NUMBER := &flat_number;
    v_phonenumber VARCHAR2(20) := '&phone_number';
    v_firstname VARCHAR2(50) := '&first_name';
    v_lastname VARCHAR2(50) := '&last_name';
BEGIN
    INSERT INTO management.TENANT (NID, FlatNo, PhoneNumber, FirstName, LastName)
    VALUES (v_nid, v_flatno, v_phonenumber, v_firstname, v_lastname);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tenant added successfully!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Failed to add tenant: ' || SQLCODE || ' - ' || SQLERRM);
        ROLLBACK;
END;
/
