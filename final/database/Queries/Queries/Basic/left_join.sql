SELECT tenant.NID, tenant.FLATNO, tenant.PHONENUMBER, expenses.TOTALEXPENSE
FROM tenant
LEFT JOIN expenses ON tenant.FLATNO = expenses.FLATNO;
