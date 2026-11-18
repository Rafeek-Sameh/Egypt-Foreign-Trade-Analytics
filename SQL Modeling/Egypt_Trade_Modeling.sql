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