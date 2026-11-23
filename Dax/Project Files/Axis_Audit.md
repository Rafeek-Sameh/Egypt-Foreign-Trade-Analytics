# مراجعة عناوين المحاور (X وY) لكل chart

اتقرت من حالة الـ JSON النهائية. `OFF` يعني العنوان مش ظاهر. عمود "وحدة الأرقام" هو Display units على المحور (`1D` يعني من غير اختصار K/M/bn).

| الصفحة | الـ chart | النوع | X (field) | عنوان X | Y (measures) | عنوان Y | Y2 | عنوان Y2 | وحدة محور Y |
|---|---|---|---|---|---|---|---|---|---|
| Import Invoice | Total Imports by Port (M USD) | clusteredBarChart | Port Name | Port | Total Imports (M USD) | Total Imports (M USD) | — | — | 1D |
| Import Invoice | Top 10 Imported Products (M USD) | clusteredBarChart | Product Name | Product | Total Imports (M USD) | Total Imports (M USD) | — | — | 1D |
| Import Invoice | Imports vs Exports Trend (M USD) & Coverage Ratio | lineClusteredColumnComboChart | Year | Year | Total Imports (M USD), Total Exports (M USD) | Imports & Exports (M USD) | Export Coverage Ratio % | Export Coverage Ratio % | 1D |
| Export Opportunities | Export Opportunity Matrix: Advantage vs Value (bubble size = rebate value) | scatterChart | Avg Export RCA | Avg Export RCA | Total Exports (M USD) | Total Exports (M USD) | — | — | 1D |
| Export Opportunities | Export Gap: Partner Market Size Index vs Egypt Exports | scatterChart | Partner Market Size Index | Partner Market Size Index (relative, not USD) | Total Exports (M USD) | Egypt Exports (M USD) | — | — | 1D |
| Export Opportunities | Top 10 Exported Products (M USD) | clusteredBarChart | Product Name | Product | Total Exports (M USD) | Total Exports (M USD) | — | — | 1D |
| Export Opportunities | Top 15 Export Opportunities (Opportunity Score) | clusteredBarChart | Product Name | Product | Export Opportunity Score | Export Opportunity Score = RCA x (1 + rebate %) | — | — | auto |
| Export Opportunities | Exports vs Imports by Partner Country (M USD) | clusteredBarChart | Partner Country | Partner Country | Total Exports (M USD), Total Imports (M USD) | Exports & Imports (M USD) | — | — | 1D |
| Localization Plan | Value Chain: Exported Raw vs Imported Finished Goods (M USD) | clusteredBarChart | Value Chain Group | Value Chain Group | Exported Raw & Intermediate (M USD), Imported Finished Goods (M USD) | Trade Value (M USD) | — | — | 1D |
| Localization Plan | Savings by Sector & Localization Priority (M USD) | barChart | Sector | Sector | Target FX Savings (M USD) | Target FX Savings (M USD) | — | — | 1D |
| Localization Plan | Savings Pareto: Top 15 Products (M USD) | lineClusteredColumnComboChart | Product Name | Product | Target FX Savings (M USD) | Target FX Savings (M USD) | Cumulative Savings % | Cumulative % of all savings | 1D |
| Localization Plan | CapEx vs Savings: Investment Efficiency (bubble size = new jobs) | scatterChart | Total Required CapEx (M USD) | Required CapEx (M USD) | Target FX Savings (M USD) | Target FX Savings (M USD) | — | — | 1D |
| Localization Plan | Top 10 Job-Creating Products (New Jobs) | clusteredBarChart | Product Name | Product | Total New Jobs | New Jobs | — | — | 1D |
| Recommendations & Analysis | Growth Momentum: Imports vs Exports YoY % | lineChart | Year | Year | Imports YoY %, Exports YoY % | YoY growth % | — | — | auto |
| Country Details | Seasonality: Trade Volume by Quarter (all years) | lineChart | Quarter Name | Quarter | Total Trade Volume | Trade Volume (USD) | — | — | auto |
| Country Details | Imports vs Exports Trend (M USD) | areaChart | Year | Year | Total Imports (M USD), Total Exports (M USD) | Trade Value (M USD) | — | — | 1D |
| Country Details | Trade by Sector (M USD) | columnChart | Sector | Sector | Total Imports (M USD), Total Exports (M USD) | Trade Value (M USD) | — | — | 1D |
| Product Details | Product Trade Trend (M USD) | lineClusteredColumnComboChart | Year | Year | Total Imports (M USD) | Imports (M USD) | Total Exports (M USD) | Exports (M USD) | 1D |
| Product Details | Capacity Gap vs Customs Protection vs Local Content (%) | clusteredColumnChart | — | OFF | Avg Capacity Gap %, Avg Customs Protection %, Avg Local Content % | Average (%) | — | — | auto |
| Product Details | Export Destinations by Country (Top 8, M USD) | ribbonChart | Year | Year | Total Exports (M USD) | Exports (M USD) | — | — | 1D |
| Product Details | Import Sources by Country (Top 10, M USD) | clusteredBarChart | Partner Country | Partner Country | Total Imports (M USD) | Imports (M USD) | — | — | 1D |
| Product Tooltip | Product Trade Trend (M USD) | lineClusteredColumnComboChart | Year | OFF | Total Imports (M USD) | OFF | Total Exports (M USD) | OFF | 1D |
| Country Tooltip | Top 5 Sectors with this Partner (M USD) | clusteredBarChart | Sector | OFF | Total Imports (M USD) | OFF | — | — | 1D |

## ملاحظات

- الـ donut والـ treemap والـ gauge والخريطة والـ decomposition tree والجداول مفيهاش محاور فمش داخلة في الجدول.
- كارت الـ tooltip (Product Tooltip وCountry Tooltip) صغير (400×300) فأضفت وحدة المحور بس ومحطتش عناوين محاور عشان متاخدش مساحة.
- `Capacity Gap vs Customs Protection` مفيهوش X لأنه 3 measures من غير category.
