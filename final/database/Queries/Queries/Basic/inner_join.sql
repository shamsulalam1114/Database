SELECT tenant.NID, tenant.FLATNO, tenant.PHONENUMBER, dues.DUE
FROM tenant
INNER JOIN dues ON tenant.FLATNO = dues.FLATNO;
