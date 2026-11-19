USE Egypt_Foreign_Trade_DB;
GO

ALTER TABLE Dim_Countries ADD CONSTRAINT PK_Dim_Countries PRIMARY KEY (Country_ID);
ALTER TABLE Dim_Ports ADD CONSTRAINT PK_Dim_Ports PRIMARY KEY (Port_ID);
ALTER TABLE Dim_Products ADD CONSTRAINT PK_Dim_Products PRIMARY KEY (Product_ID);
ALTER TABLE Dim_Date ADD CONSTRAINT PK_Dim_Date PRIMARY KEY (Date_Key);
ALTER TABLE Dim_Industrial_Opportunity ADD CONSTRAINT PK_Dim_Industrial_Opportunity PRIMARY KEY (Product_ID);
ALTER TABLE Fact_Trade_Transactions ADD CONSTRAINT PK_Fact_Trade_Transactions PRIMARY KEY (Transaction_ID);
GO

ALTER TABLE Fact_Trade_Transactions ADD CONSTRAINT FK_Fact_Countries FOREIGN KEY (Country_ID) REFERENCES Dim_Countries (Country_ID);
ALTER TABLE Fact_Trade_Transactions ADD CONSTRAINT FK_Fact_Ports FOREIGN KEY (Port_ID) REFERENCES Dim_Ports (Port_ID);
ALTER TABLE Fact_Trade_Transactions ADD CONSTRAINT FK_Fact_Products FOREIGN KEY (Product_ID) REFERENCES Dim_Products (Product_ID);
ALTER TABLE Fact_Trade_Transactions ADD CONSTRAINT FK_Fact_Date FOREIGN KEY (Date_Key) REFERENCES Dim_Date (Date_Key);
ALTER TABLE Fact_Trade_Transactions ADD CONSTRAINT FK_Fact_Industrial FOREIGN KEY (Product_ID) REFERENCES Dim_Industrial_Opportunity (Product_ID);
GO


SELECT name FROM sys.indexes
WHERE object_id = OBJECT_ID('Fact_Trade_Transactions')
AND name LIKE 'IX_Fact_%';

----------------------------------------------------------



USE Egypt_Foreign_Trade_DB;
GO
ALTER TABLE Fact_Trade_Transactions
ADD CONSTRAINT FK_Fact_Industrial
FOREIGN KEY (Product_ID)
REFERENCES Dim_Industrial_Opportunity (Product_ID);

-- Check existing relationships
SELECT
    name,
    OBJECT_NAME(parent_object_id) AS Parent_Table,
    OBJECT_NAME(referenced_object_id) AS Referenced_Table
FROM sys.foreign_keys;

-- Check unmatched Product_ID
SELECT I.Product_ID
FROM Dim_Industrial_Opportunity I
LEFT JOIN Dim_Products P
    ON I.Product_ID = P.Product_ID
WHERE P.Product_ID IS NULL;

SELECT I.Product_ID
FROM Dim_Industrial_Opportunity I
LEFT JOIN Dim_Products P
    ON I.Product_ID = P.Product_ID
WHERE P.Product_ID IS NULL;

----------------------------------------------------------



USE Egypt_Foreign_Trade_DB;
GO

-- Remove old relationship
IF EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Fact_Industrial'
)
BEGIN
    ALTER TABLE Fact_Trade_Transactions
    DROP CONSTRAINT FK_Fact_Industrial;
END
GO

-- Create new relationship
IF NOT EXISTS (
    SELECT 1
    FROM sys.foreign_keys
    WHERE name = 'FK_Industrial_Products'
)
BEGIN
    ALTER TABLE Dim_Industrial_Opportunity
    ADD CONSTRAINT FK_Industrial_Products
    FOREIGN KEY (Product_ID)
    REFERENCES Dim_Products(Product_ID);
END
GO

----------------------------------------------------------

USE Egypt_Foreign_Trade_DB;
GO

SELECT
    fk.name AS Foreign_Key_Name,
    OBJECT_NAME(fk.parent_object_id) AS Child_Table,
    OBJECT_NAME(fk.referenced_object_id) AS Parent_Table,
    fk.is_disabled AS Is_Disabled,
    fk.is_not_trusted AS Is_Not_Trusted
FROM sys.foreign_keys fk
ORDER BY Child_Table;
GO

----------------------------------------------------------

SELECT
    'Fact - Countries' AS Relationship,
    COUNT(*) AS Orphan_Records
FROM Fact_Trade_Transactions F
LEFT JOIN Dim_Countries D
    ON F.Country_ID = D.Country_ID
WHERE F.Country_ID IS NOT NULL
AND D.Country_ID IS NULL

UNION ALL

SELECT
    'Fact - Ports',
    COUNT(*)
FROM Fact_Trade_Transactions F
LEFT JOIN Dim_Ports D
    ON F.Port_ID = D.Port_ID
WHERE F.Port_ID IS NOT NULL
AND D.Port_ID IS NULL

UNION ALL

SELECT
    'Fact - Products',
    COUNT(*)
FROM Fact_Trade_Transactions F
LEFT JOIN Dim_Products D
    ON F.Product_ID = D.Product_ID
WHERE F.Product_ID IS NOT NULL
AND D.Product_ID IS NULL

UNION ALL

SELECT
    'Fact - Date',
    COUNT(*)
FROM Fact_Trade_Transactions F
LEFT JOIN Dim_Date D
    ON F.Date_Key = D.Date_Key
WHERE F.Date_Key IS NOT NULL
AND D.Date_Key IS NULL

UNION ALL

SELECT
    'Industrial - Products',
    COUNT(*)
FROM Dim_Industrial_Opportunity I
LEFT JOIN Dim_Products P
    ON I.Product_ID = P.Product_ID
WHERE I.Product_ID IS NOT NULL
AND P.Product_ID IS NULL;
GO



----------------------------------------------------------


SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE CONSTRAINT_NAME IN (
    SELECT CONSTRAINT_NAME
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;