USE master;
GO
SELECT name, type_desc, create_date
FROM sys.objects
WHERE is_ms_shipped = 0;