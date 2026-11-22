USE Egypt_Foreign_Trade_DB;
GO

-- Q2: Top 15 export opportunities (RCA > 1) ranked by rebate-adjusted score
SELECT TOP (15)
    p.Product_Name,
    p.Sector,
    o.Export_RCA_Index,
    o.Export_Rebate_Incentive_Pct,
    ROUND(o.Export_RCA_Index * (1 + o.Export_Rebate_Incentive_Pct / 100.0), 2) AS Export_Opportunity_Score
FROM Dim_Industrial_Opportunity AS o
INNER JOIN Dim_Products AS p ON o.Product_ID = p.Product_ID
WHERE o.Export_RCA_Index > 1
ORDER BY Export_Opportunity_Score DESC;
GO