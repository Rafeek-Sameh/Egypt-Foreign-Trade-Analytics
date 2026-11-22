USE Egypt_Foreign_Trade_DB;
GO

-- Q3: Top 10 localization opportunities by target FX savings
SELECT TOP (10)
    p.Product_Name,
    o.Target_Annual_FX_Savings_M_USD AS Target_FX_Savings_M_USD,
    o.Required_Factories_Count * o.Est_Factory_CapEx_M_USD AS Required_CapEx_M_USD,
    o.Estimated_Total_New_Jobs AS Total_New_Jobs,
    o.Golden_License_Eligible
FROM Dim_Industrial_Opportunity AS o
INNER JOIN Dim_Products AS p ON o.Product_ID = p.Product_ID
ORDER BY o.Target_Annual_FX_Savings_M_USD DESC;
GO