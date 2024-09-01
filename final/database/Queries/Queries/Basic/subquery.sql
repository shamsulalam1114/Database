SELECT Flatno, NID
FROM tenant
WHERE flatno IN (SELECT FLATNO FROM dues WHERE DUE > 300);
commit;