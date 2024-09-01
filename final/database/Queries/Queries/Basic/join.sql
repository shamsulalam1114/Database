SELECT tenant.NID, tenant.FLATNO, tenant.PHONENUMBER,
       expenses.TOTALEXPENSE, expenses.DUE, expenses.GASBILL, expenses.ELECTRICITYBILL,
       expenses.RENT
FROM tenant
JOIN expenses ON tenant.FLATNO = expenses.FLATNO
WHERE tenant.FLATNO BETWEEN 301 AND 305;
