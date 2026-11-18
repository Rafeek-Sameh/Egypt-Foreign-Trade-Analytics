USE Egypt_Foreign_Trade_DB;
GO

SELECT OBJECT_NAME(parent_object_id) AS TableName, name AS PK_Name
FROM sys.key_constraints
WHERE type = 'PK'
ORDER BY TableName;

SELECT name AS FK_Name,
       OBJECT_NAME(parent_object_id) AS FactTable,
       OBJECT_NAME(referenced_object_id) AS DimTable
FROM sys.foreign_keys
ORDER BY name;