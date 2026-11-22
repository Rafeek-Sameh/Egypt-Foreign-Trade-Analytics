USE Egypt_Foreign_Trade_DB;
GO

-- Q1: Yearly imports, exports and trade balance (M USD)
WITH Yearly AS (
    SELECT
        d.[Year],
        SUM(CASE WHEN f.Trade_Flow = 'Import' THEN f.Total_Value_USD ELSE 0 END) / 1000000.0 AS Imports_M_USD,
        SUM(CASE WHEN f.Trade_Flow = 'Export' THEN f.Total_Value_USD ELSE 0 END) / 1000000.0 AS Exports_M_USD
    FROM Fact_Trade_Transactions AS f
    INNER JOIN Dim_Date AS d ON f.Date_Key = d.Date_Key
    GROUP BY d.[Year]
)
SELECT
    [Year],
    ROUND(Imports_M_USD, 2) AS Total_Imports_M_USD,
    ROUND(Exports_M_USD, 2) AS Total_Exports_M_USD,
    ROUND(Exports_M_USD - Imports_M_USD, 2) AS Trade_Balance_M_USD,
    ROUND(Exports_M_USD * 100.0 / NULLIF(Imports_M_USD, 0), 1) AS Export_Coverage_Pct
FROM Yearly
ORDER BY [Year];
GO