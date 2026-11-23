# جرد التقرير (النسخة النهائية)

كل صفحة وكل visual: النوع، الحجم، الـ fields في Build visual، وأهم إعدادات الـ Format المضبوطة.
- `[[X]]` = measure، `X[Y]` = column، `obj:` = إعدادات الـ visual، `vco:` = إعدادات الحاوية (عنوان/tooltip).
- الإعدادات اللي مش مكتوبة هنا يعني على الـ default.

```
# PAGE 1: Overview  [9d476c44329ca9103127]  type=Standard size=1920x1080 vis=Visible
  (no visuals)

# PAGE 2: Import Invoice  [67c9874396d763e2232b]  type=Standard size=3840x2160 vis=Visible
  PAGE-FILTER: Dim_Ports[Port Name] type=Categorical how=User
  - [4ce91257518688225704] slicer  pos=(1001,0) size=(280x110) title=None
      Values: Dim_Date[Year]  queryRef=Dim_Date.Year
      obj:data.mode='Between'
  - [c7944fcd8121acd53a00] slicer  pos=(1319,0) size=(280x110) title=None
      Values: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      obj:data.mode='Dropdown'
  - [59a3e7e93878ee991202] slicer  pos=(1641,0) size=(280x110) title=None
      Values: Dim_Ports[Port Name]  queryRef=Dim_Ports.Port Name
      obj:data.mode='Dropdown'
  - [635cb417cb8a3e3777ce] cardVisual  pos=(80,112) size=(662x185) title=None
      Data: Measures_Table[[Export Coverage Ratio %]]  queryRef=Measures_Table.Export Coverage Ratio % displayName='Export Coverage Ratio'
  - [0a0f36f3165220338021] cardVisual  pos=(840,112) size=(717x185) title=None
      Data: Measures_Table[[Trade Balance]]  queryRef=Measures_Table.Trade Balance displayName='Trade Balance'
      obj:value.labelDisplayUnits=0D @Measures_Table.Trade Balance
      obj:value.labelPrecision=1L @Measures_Table.Trade Balance
      obj:value.showBlankAs='' @default
      obj:value.fontColor=color MEASURE:Measures_Table[[Trade Balance Color]] @default
      obj:referenceLabel.value=MEASURE:Measures_Table[[Trade Position]] @Measures_Table.Trade Balance
  - [a2960968e76023007c50] cardVisual  pos=(1676,112) size=(568x185) title=None
      Data: Measures_Table[[Total Exports USD]]  queryRef=Measures_Table.Total Exports USD displayName='Total Exports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Exports YoY Label]] @Measures_Table.Total Exports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Exports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Exports USD
  - [988f98d28b0257babcb9] cardVisual  pos=(2400,112) size=(713x185) title=None
      Data: Measures_Table[[Total Imports USD]]  queryRef=Measures_Table.Total Imports USD displayName='Total Imports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Imports YoY Label]] @Measures_Table.Total Imports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Imports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Imports USD
  - [4dc220b1dbbc15eca96e] cardVisual  pos=(3175,114) size=(554x186) title=None
      Data: Measures_Table[[WTO Standard Imports %]]  queryRef=Measures_Table.WTO Standard Imports % displayName='Standard WTO Imports'
  - [3adbaa3779ae47219004] lineClusteredColumnComboChart  pos=(1976,297) size=(1860x934) title='Imports vs Exports Trend (M USD) & Coverage Ratio'
      Category: Dim_Date[Year]  queryRef=Dim_Date.Year
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      Y2: Measures_Table[[Export Coverage Ratio %]]  queryRef=Measures_Table.Export Coverage Ratio %
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Imports & Exports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      obj:y2Axis.showAxisTitle=true
      obj:y2Axis.titleText='Export Coverage Ratio %'
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Year'
      vco:title.show=true
      vco:subTitle.show=false
  - [1f24aca872a2a2de0c03] cardVisual  pos=(82,354) size=(327x254) title=None
      Data: Measures_Table[[EU Partnership Imports %]]  queryRef=Measures_Table.EU Partnership Imports % displayName='EU Partnership Imports'
  - [2911311005408ae41cab] cardVisual  pos=(745,354) size=(432x218) title=None
      Data: Measures_Table[[Estimated Tariff Revenue USD]]  queryRef=Measures_Table.Estimated Tariff Revenue USD displayName='Estimated Tariff Revenue'
      obj:value.labelDisplayUnits=0D @Measures_Table.Estimated Tariff Revenue USD
      obj:value.labelPrecision=1L @Measures_Table.Estimated Tariff Revenue USD
  - [18a53d04dba257356690] clusteredBarChart  pos=(82,609) size=(1699x622) title='Total Imports by Port (M USD)'
      Category: Dim_Ports[Port Name]  queryRef=Dim_Ports.Port Name
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelPrecision=0L
      obj:labels.labelDisplayUnits=1D
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Port'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Total Imports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
  - [6a7fed0578610b8cd8c0] donutChart  pos=(0,1231) size=(1354x930) title='Import Share by Partner Country (Top 10)'
      Category: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      Y: Measures_Table[[Country Share of Imports %]]  queryRef=Measures_Table.Country Share of Imports %
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='49109afa025c3a916275'
      FILTER: Dim_Countries[Partner Country] type=TopN
  - [78e1b15c8c9c27821019] treemap  pos=(1354,1231) size=(1241x934) title='Imports by Sector (M USD)'
      Group: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Values: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
  - [39832efa30080a6aa7b0] clusteredBarChart  pos=(2591,1231) size=(1245x930) title='Top 10 Imported Products (M USD)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Product'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Total Imports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
      FILTER: Dim_Products[Product Name] type=TopN

# PAGE 3: Export Opportunities  [66c1631c700340c26437]  type=Standard size=3840x2160 vis=Visible
  - [f6d5655c570d7897bcd4] cardVisual  pos=(441,0) size=(299x155) title=None
      Data: Measures_Table[[Export Advantage Products]]  queryRef=Measures_Table.Export Advantage Products displayName='Advantage Products'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Advantage Share Label]] @Measures_Table.Export Advantage Products
      obj:value.labelDisplayUnits=1D @Measures_Table.Export Advantage Products
      obj:value.labelPrecision=0L @Measures_Table.Export Advantage Products
  - [79ae24d00bb861c53410] cardVisual  pos=(741,0) size=(299x155) title=None
      Data: Measures_Table[[Total Exports USD]]  queryRef=Measures_Table.Total Exports USD displayName='Total Exports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Exports YoY Label]] @Measures_Table.Total Exports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Exports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Exports USD
  - [f6f41c2226d366597983] cardVisual  pos=(1040,0) size=(299x155) title=None
      Data: Measures_Table[[Export Rebate Value USD]]  queryRef=Measures_Table.Export Rebate Value USD displayName='Export Rebate Value'
      obj:value.labelDisplayUnits=0D @Measures_Table.Export Rebate Value USD
      obj:value.labelPrecision=1L @Measures_Table.Export Rebate Value USD
      obj:value.transparency=0D @Measures_Table.Export Rebate Value USD
      obj:value.show=true
      obj:referenceLabel.value=MEASURE:Measures_Table[[Rebate Rate Label]] @Measures_Table.Export Rebate Value USD
      obj:label.show=true @default
      obj:referenceLabelValue.valueBold=false @Measures_Table.Export Rebate Value USD
  - [5b4980418c4dcd16b526] slicer  pos=(1339,0) size=(280x87) title=None
      Values: Dim_Date[Year]  queryRef=Dim_Date.Year
      obj:data.mode='Between'
  - [33a16a2e6da375b33673] slicer  pos=(1619,0) size=(299x87) title=None
      Values: Dim_Countries[Region]  queryRef=Dim_Countries.Region
      obj:data.mode='Dropdown'
  - [60000ac02db9219a1aff] slicer  pos=(2306,0) size=(1534x217) title=None
      Values: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      obj:data.mode='Basic'
  - [b0dfaebd40000da501e4] clusteredBarChart  pos=(0,279) size=(1111x800) title='Top 15 Export Opportunities (Opportunity Score)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Tooltips: Measures_Table[[Avg Export RCA]]  queryRef=Measures_Table.Avg Export RCA
      Y: Measures_Table[[Export Opportunity Score]]  queryRef=Measures_Table.Export Opportunity Score
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Export Opportunity Score = RCA x (1 + rebate %)'
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Product'
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
      FILTER: Dim_Products[Product Name] type=TopN
      FILTER: Measures_Table[[Export Opportunity Score]] type=Advanced
      FILTER: Measures_Table[[Avg Export RCA]] type=Advanced
  - [c0da6078900a5048bdd2] clusteredBarChart  pos=(1113,277) size=(1195x1027) title='Exports vs Imports by Partner Country (M USD)'
      Category: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:labels.labelPrecision=0L
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Partner Country'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Exports & Imports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:visualTooltip.section='49109afa025c3a916275'
      vco:title.show=true
  - [18a6a9007861d6a96a0d] scatterChart  pos=(2306,279) size=(1535x800) title='Export Opportunity Matrix: Advantage vs Value (bubble size = rebate value)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Series: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Size: Measures_Table[[Export Rebate Value USD]]  queryRef=Measures_Table.Export Rebate Value USD
      X: Measures_Table[[Avg Export RCA]]  queryRef=Measures_Table.Avg Export RCA
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:xAxisReferenceLine.show=true @1
      obj:xAxisReferenceLine.displayName='RCA = 1 (comparative advantage threshold)' @1
      obj:xAxisReferenceLine.value=1D @1
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Avg Export RCA'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Total Exports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
  - [95f988c5cd550646195c] clusteredBarChart  pos=(0,1081) size=(1113x1081) title='Top 10 Exported Products (M USD)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Product'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Total Exports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
      FILTER: Dim_Products[Product Name] type=TopN
  - [38d2c547bb000da89826] shapeMap  pos=(2541,1079) size=(1299x1082) title='Top Export Destinations (M USD)'
      Category: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      Value: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:dataPoint.fillRule={"linearGradient2": {"min": {"color": {"expr": {"Literal": {"Value": "'#A1B8D4'"}}}}, "max": {"color
      obj:shape.datasourceType='file_upload'
      obj:shape.map={"geoJson": {"type": {"expr": {"Literal": {"Value": "'packaged'"}}}, "name": {"expr": {"Literal": {"
      obj:shape.projectionEnum='mercator'
      obj:zoom.selectionZoom=false
      obj:zoom.autoZoom=true
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='49109afa025c3a916275'
  - [a8558aee88248e9296e7] pivotTable  pos=(1190,1368) size=(502x215) title='Trade Behavior By Commodity Class (M USD)'
      Rows: Dim_Products[Commodity Trade Class]  queryRef=Dim_Products.Commodity Trade Class
      Values: Measures_Table[[Products (Count)]]  queryRef=Measures_Table.Products (Count)
      Values: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      Values: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      vco:title.show=true
      FILTER: Dim_Products[Commodity Trade Class] type=Categorical
      FILTER: Measures_Table[[Products (Count)]] type=Advanced
      FILTER: Measures_Table[[Total Exports (M USD)]] type=Advanced
      FILTER: Measures_Table[[Total Imports (M USD)]] type=Advanced
  - [5269368b95a49b9b4006] scatterChart  pos=(1040,1605) size=(1302x555) title='Export Gap: Partner Market Size Index vs Egypt Exports'
      Category: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      X: Measures_Table[[Partner Market Size Index]]  queryRef=Measures_Table.Partner Market Size Index
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:categoryAxis.titleText='Partner Market Size Index (relative, not USD)'
      obj:categoryAxis.labelDisplayUnits=0D
      obj:categoryAxis.labelPrecision=0L
      obj:categoryAxis.showAxisTitle=true
      obj:valueAxis.titleText='Egypt Exports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      obj:valueAxis.showAxisTitle=true
      obj:categoryLabels.show=true

# PAGE 4: Localization Plan  [60a0df0cec02170200cc]  type=Standard size=3840x2160 vis=Visible
  - [d07f9dc0040086985de8] cardVisual  pos=(0,0) size=(321x253) title=None
      Data: Measures_Table[[Target FX Savings USD]]  queryRef=Measures_Table.Target FX Savings USD displayName='Target FX Savings'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Savings Label]] @Measures_Table.Target FX Savings USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Target FX Savings USD
      obj:value.labelPrecision=1L @Measures_Table.Target FX Savings USD
  - [5bd20f84b02de15378ad] cardVisual  pos=(321,0) size=(359x254) title=None
      Data: Measures_Table[[Total Required CapEx USD]]  queryRef=Measures_Table.Total Required CapEx USD displayName='Required CapEx'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Payback Label]] @Measures_Table.Total Required CapEx USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Required CapEx USD
      obj:value.labelPrecision=1L @Measures_Table.Total Required CapEx USD
  - [10eb989364c9dcb3400e] cardVisual  pos=(672,0) size=(273x254) title=None
      Data: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs displayName='New Jobs'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Jobs Label]] @Measures_Table.Total New Jobs
      obj:value.labelDisplayUnits=1D @Measures_Table.Total New Jobs
      obj:value.labelPrecision=0L @Measures_Table.Total New Jobs
  - [f8a26e6bcbe9a3118a69] slicer  pos=(1013,0) size=(323x101) title=None
      Values: Dim_Industrial_Opportunity[Golden License Eligible]  queryRef=Dim_Industrial_Opportunity.Golden License Eligible
      obj:data.mode='Basic'
      obj:general.orientation=1D
  - [9d7d3b1a020a90d2940b] slicer  pos=(1335,0) size=(280x101) title=None
      Values: Dim_Products[Localization Priority]  queryRef=Dim_Products.Localization Priority
      obj:data.mode='Basic'
      obj:general.orientation=1D
  - [24951de5ecb4a3003242] slicer  pos=(1640,0) size=(280x101) title=None
      Values: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      obj:data.mode='Dropdown'
  - [7e4280caebaa9a7692b6] cardVisual  pos=(1962,0) size=(321x253) title=None
      Data: Measures_Table[[Golden License Savings %]]  queryRef=Measures_Table.Golden License Savings % displayName='Golden License Savings'
  - [d3bba1073b551cbacb07] cardVisual  pos=(1018,126) size=(314x224) title=None
      Data: Measures_Table[[Total Required Factories]]  queryRef=Measures_Table.Total Required Factories displayName='Required Factories'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Factory Label]] @Measures_Table.Total Required Factories
      obj:value.labelDisplayUnits=1D @Measures_Table.Total Required Factories
      obj:value.labelPrecision=0L @Measures_Table.Total Required Factories
  - [4179f1de90044de9a637] lineClusteredColumnComboChart  pos=(0,717) size=(1068x601) title='Savings Pareto: Top 15 Products (M USD)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Y: Measures_Table[[Target FX Savings (M USD)]]  queryRef=Measures_Table.Target FX Savings (M USD)
      Y2: Measures_Table[[Cumulative Savings %]]  queryRef=Measures_Table.Cumulative Savings %
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Target FX Savings (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      obj:y2Axis.showAxisTitle=true
      obj:y2Axis.titleText='Cumulative % of all savings'
      obj:y2Axis.secondaryStart=0D
      obj:y2Axis.secondaryEnd=1D
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Product'
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
      FILTER: Dim_Products[Product Name] type=TopN
  - [aaf36ca9940b1d8a0c15] scatterChart  pos=(1068,717) size=(1716x601) title='CapEx vs Savings: Investment Efficiency (bubble size = new jobs)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Series: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Size: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs
      X: Measures_Table[[Total Required CapEx (M USD)]]  queryRef=Measures_Table.Total Required CapEx (M USD)
      Y: Measures_Table[[Target FX Savings (M USD)]]  queryRef=Measures_Table.Target FX Savings (M USD)
      obj:referenceLine.show=true @Measures_Table.Total Required CapEx (M USD)
      obj:referenceLine.displayName='Average Required CapEx' @Measures_Table.Total Required CapEx (M USD)
      obj:referenceLine.value={"Aggregation": {"Expression": {"SelectRef": {"ExpressionName": "Measures_Table. @Measures_Table.Total Required CapEx (M USD)
      obj:zoom.show=false
      obj:categoryLabels.show=false
      obj:ratioLine.show=true
      obj:ratioLine.displayName='Overall Savings-to-CapEx ratio'
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Required CapEx (M USD)'
      obj:categoryAxis.labelDisplayUnits=1D
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Target FX Savings (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
  - [5066a083d069b028408c] tableEx  pos=(2783,717) size=(1053x601) title='Top Products Scorecard'
      Values: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Values: Measures_Table[[Target FX Savings (M USD)]]  queryRef=Measures_Table.Target FX Savings (M USD)
      Values: Measures_Table[[Total Required CapEx (M USD)]]  queryRef=Measures_Table.Total Required CapEx (M USD)
      Values: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs
      Values: Measures_Table[[Payback Period (Years)]]  queryRef=Measures_Table.Payback Period (Years)
      Values: Measures_Table[[Priority Score]]  queryRef=Measures_Table.Priority Score
      obj:columnFormatting.dataBars={"positiveColor": {"solid": {"color": {"expr": {"Literal": {"Value": "'maxColor'"}}}}}, "negativeCol @Measures_Table.Priority Score
      vco:title.show=true
      FILTER: Dim_Products[Product Name] type=TopN
  - [c236b7a97258b920cde7] clusteredBarChart  pos=(0,1317) size=(1531x843) title='Top 10 Job-Creating Products (New Jobs)'
      Category: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Y: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:labels.labelPrecision=0L
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Product'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='New Jobs'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
      FILTER: Dim_Products[Product Name] type=TopN
  - [320929a3c15eddd104c8] barChart  pos=(2432,1317) size=(1404x843) title='Savings by Sector & Localization Priority (M USD)'
      Category: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Series: Dim_Products[Localization Priority]  queryRef=Dim_Products.Localization Priority
      Y: Measures_Table[[Target FX Savings (M USD)]]  queryRef=Measures_Table.Target FX Savings (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:labels.labelPrecision=0L
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Sector'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Target FX Savings (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
  - [e0dbe15d04930c9730a8] pivotTable  pos=(1577,1339) size=(434x268) title='Savings by Local Raw Material & Priority (M USD)'
      Columns: Dim_Products[Localization Priority]  queryRef=Dim_Products.Localization Priority
      Rows: Dim_Products[Local Raw Material]  queryRef=Dim_Products.Local Raw Material
      Values: Measures_Table[[Target FX Savings (M USD)]]  queryRef=Measures_Table.Target FX Savings (M USD)
      vco:title.show=true
  - [00fae631c53cd8a9281a] clusteredBarChart  pos=(1530,1480) size=(902x680) title='Value Chain: Exported Raw vs Imported Finished Goods (M USD)'
      Category: Dim_Products[Value Chain Group]  queryRef=Dim_Products.Value Chain Group
      Y: Measures_Table[[Exported Raw & Intermediate (M USD)]]  queryRef=Measures_Table.Exported Raw & Intermediate (M USD)
      Y: Measures_Table[[Imported Finished Goods (M USD)]]  queryRef=Measures_Table.Imported Finished Goods (M USD)
      obj:legend.position='TopCenter'
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:labels.labelPrecision=0L
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Value Chain Group'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Trade Value (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true

# PAGE 5: Recommendations & Analysis  [a373252c945dec981a3a]  type=Standard size=1920x1080 vis=Visible
  - [a42b7c1ada70053d5d41] cardVisual  pos=(0,0) size=(268x183) title=None
      Data: Measures_Table[[Top Import Partner]]  queryRef=Measures_Table.Top Import Partner
      obj:referenceLabel.value=MEASURE:Measures_Table[[Top Import Partner Label]] @Measures_Table.Top Import Partner
      FILTER: Measures_Table[[Top Import Partner]] type=Advanced
  - [cd854bc8a1a21d3345b0] cardVisual  pos=(325,0) size=(280x183) title=None
      Data: Measures_Table[[Top Export Destination]]  queryRef=Measures_Table.Top Export Destination
      obj:referenceLabel.value=MEASURE:Measures_Table[[Top Export Destination Label]] @Measures_Table.Top Export Destination
      FILTER: Measures_Table[[Top Export Destination]] type=Advanced
  - [d9323de2d86b85aa3279] cardVisual  pos=(643,0) size=(280x183) title=None
      Data: Measures_Table[[Strategic Imports Share %]]  queryRef=Measures_Table.Strategic Imports Share % displayName='Strategic Imports Share'
  - [7ec4dd787e8c3089c955] cardVisual  pos=(984,0) size=(280x183) title=None
      Data: Measures_Table[[Imports CAGR 2021-2025]]  queryRef=Measures_Table.Imports CAGR 2021-2025 displayName="Imports CAGR '21–'25"
      obj:referenceLabel.value=MEASURE:Measures_Table[[Growth Gap :]] @Measures_Table.Imports CAGR 2021-2025
      obj:value.fontColor=color MEASURE:Measures_Table[[Growth Gap Color]] @default
      vco:title.show=false
  - [bbe4dd707ee10374005d] cardVisual  pos=(1314,0) size=(280x183) title=None
      Data: Measures_Table[[Exports CAGR 2021-2025]]  queryRef=Measures_Table.Exports CAGR 2021-2025 displayName="Exports CAGR '21–'25"
      obj:value.fontColor=color MEASURE:Measures_Table[[Growth Gap Color]] @default
  - [b6551c445d9ab116c4c5] cardVisual  pos=(1640,0) size=(280x183) title=None
      Data: Measures_Table[[High Priority Products]]  queryRef=Measures_Table.High Priority Products
      obj:referenceLabel.value=MEASURE:Measures_Table[[Priority Label]] @Measures_Table.High Priority Products
      obj:value.labelDisplayUnits=1D @Measures_Table.High Priority Products
      obj:value.labelPrecision=0L @Measures_Table.High Priority Products
  - [67723f10d74e96920c3d] decompositionTreeVisual  pos=(0,183) size=(984x430) title='Import Drivers Explorer (M USD)'
      Analyze: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      ExplainBy: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      ExplainBy: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      ExplainBy: Dim_Ports[Port Name]  queryRef=Dim_Ports.Port Name
      ExplainBy: Dim_Countries[Trade Agreement]  queryRef=Dim_Countries.Trade Agreement
      obj:tree.effectiveBarsPerLevel=5L
      vco:title.show=true
  - [24bde26aa992e0e09747] lineChart  pos=(0,623) size=(984x430) title='Growth Momentum: Imports vs Exports YoY %'
      Category: Dim_Date[Year]  queryRef=Dim_Date.Year
      Y: Measures_Table[[Imports YoY %]]  queryRef=Measures_Table.Imports YoY %
      Y: Measures_Table[[Exports YoY %]]  queryRef=Measures_Table.Exports YoY %
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='YoY growth %'
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Year'
      vco:subTitle.show=false
  - [50e2b2c4dc9dd88a7566] pivotTable  pos=(984,624) size=(936x430) title='Sector Summary (M USD)'
      Rows: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Values: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      Values: Measures_Table[[Target FX Savings (M USD)]]  queryRef=Measures_Table.Target FX Savings (M USD)
      Values: Measures_Table[[Total Required CapEx (M USD)]]  queryRef=Measures_Table.Total Required CapEx (M USD)
      Values: Measures_Table[[Savings per $ CapEx]]  queryRef=Measures_Table.Savings per $ CapEx
      Values: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs
      obj:values.backColor=color {"FillRule": {"Input": {"Measure": {"Expression": {"SourceRef": {"Entity": "Meas @Measures_Table.Savings per $ CapEx
      vco:title.show=true

# PAGE 6: Country Details  [8e3f1ee969b320d3e2dd]  type=Standard size=1920x1080 vis=HiddenInViewMode
  PAGE-FILTER: Dim_Countries[Partner Country] type=Categorical how=Drillthrough
  - [07c6d1665c1b0236615a] cardVisual  pos=(0,0) size=(1473x107) title=None
      Data: Measures_Table[[Country Title]]  queryRef=Measures_Table.Country Title
      obj:label.show=false @default
  - [2ff06c0b00b8d560a0ec] actionButton  pos=(1744,0) size=(177x41) title=None
      obj:icon.shapeType='back' @default
      vco:visualLink.show=true
      vco:visualLink.type='Back'
  - [a83ad87070109e729b29] cardVisual  pos=(0,109) size=(243x150) title=None
      Data: Measures_Table[[Total Imports USD]]  queryRef=Measures_Table.Total Imports USD displayName='Total Imports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Imports YoY Label]] @Measures_Table.Total Imports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Imports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Imports USD
  - [1a22a78eb2105dc31887] cardVisual  pos=(241,107) size=(243x150) title=None
      Data: Measures_Table[[Total Exports USD]]  queryRef=Measures_Table.Total Exports USD displayName='Total Exports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Exports YoY Label]] @Measures_Table.Total Exports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Exports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Exports USD
  - [54af240908b8760ed1cc] cardVisual  pos=(481,107) size=(243x150) title=None
      Data: Measures_Table[[Trade Balance]]  queryRef=Measures_Table.Trade Balance displayName='Trade Balance'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Trade Position]] @Measures_Table.Trade Balance
      obj:value.fontColor=color MEASURE:Measures_Table[[Trade Balance Color]] @default
      obj:value.labelDisplayUnits=0D @Measures_Table.Trade Balance
      obj:value.labelPrecision=1L @Measures_Table.Trade Balance
  - [c80e7fee6c29ae1d1734] cardVisual  pos=(722,107) size=(243x150) title=None
      Data: Measures_Table[[Country Share of Imports %]]  queryRef=Measures_Table.Country Share of Imports % displayName='Share of Imports'
  - [59501cad3d1c60047055] cardVisual  pos=(963,109) size=(239x148) title=None
      Data: Max(Dim_Countries[Trade Agreement])  queryRef=CountNonNull(Dim_Countries.Trade Agreement) displayName='Trade Agreement'
  - [e742fb00a06c70aa60ac] cardVisual  pos=(1200,109) size=(243x150) title=None
      Data: Measures_Table[[Estimated Tariff Revenue USD]]  queryRef=Measures_Table.Estimated Tariff Revenue USD displayName='Estimated Tariff Revenue'
      obj:value.labelDisplayUnits=0D @Measures_Table.Estimated Tariff Revenue USD
      obj:value.labelPrecision=1L @Measures_Table.Estimated Tariff Revenue USD
  - [256a4db82bb31936e3b2] cardVisual  pos=(1441,109) size=(239x150) title=None
      Data: Max(Dim_Countries[Region])  queryRef=Min(Dim_Countries.Region) displayName='Region'
  - [07b64ae308c40e00402a] cardVisual  pos=(1677,107) size=(243x150) title=None
      Data: Measures_Table[[Transactions Count]]  queryRef=Measures_Table.Transactions Count displayName='Transactions'
      obj:value.labelDisplayUnits=1D @Measures_Table.Transactions Count
      obj:value.labelPrecision=0L @Measures_Table.Transactions Count
  - [2b67b25019c80a803a7d] areaChart  pos=(0,259) size=(774x437) title='Imports vs Exports Trend (M USD)'
      Category: Dim_Date[Year]  queryRef=Dim_Date.Year
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Year'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Trade Value (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
  - [492d236b0a69ec11767c] treemap  pos=(774,257) size=(1147x439) title='Top Products Imported from this Country (M USD)'
      Group: Dim_Products[Product Name]  queryRef=Dim_Products.Product Name
      Values: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='1b7d1941d295c08cd640'
  - [49e6244dd8a3854bc2ad] donutChart  pos=(0,706) size=(546x375) title='Port Usage (% of transactions)'
      Category: Dim_Ports[Port Name]  queryRef=Dim_Ports.Port Name
      Y: Measures_Table[[Port Share by Transactions %]]  queryRef=Measures_Table.Port Share by Transactions %
      vco:title.show=true
      vco:subTitle.show=false
  - [a2a23a064e0c6ae87948] columnChart  pos=(546,706) size=(636x375) title='Trade by Sector (M USD)'
      Category: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:labels.labelPrecision=0L
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Sector'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Trade Value (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
  - [27e24db60059b87050dc] lineChart  pos=(1182,706) size=(738x374) title='Seasonality: Trade Volume by Quarter (all years)'
      Category: Dim_Date[Quarter Name]  queryRef=Dim_Date.Quarter Name
      Y: Measures_Table[[Total Trade Volume]]  queryRef=Measures_Table.Total Trade Volume
      obj:labels.show=true
      obj:labels.labelDisplayUnits=0D
      obj:labels.labelPrecision=1L
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Quarter'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Trade Volume (USD)'
      vco:title.show=true
      vco:subTitle.show=false

# PAGE 7: Product Details  [754831b98a0ae34490cb]  type=Standard size=1920x1080 vis=HiddenInViewMode
  PAGE-FILTER: Dim_Products[Product Name] type=Categorical how=Drillthrough
  - [393cf88c44655062173e] cardVisual  pos=(0,0) size=(1442x99) title=None
      Data: Measures_Table[[Product Title]]  queryRef=Measures_Table.Product Title
      obj:label.show=false @default
  - [724f8e379c8679abe0be] actionButton  pos=(1635,0) size=(286x52) title=None
      obj:icon.shapeType='back' @default
      vco:visualLink.show=true
      vco:visualLink.type='Back'
  - [59848848e94cae02453a] cardVisual  pos=(0,107) size=(222x123) title=None
      Data: Measures_Table[[Total Imports USD]]  queryRef=Measures_Table.Total Imports USD displayName='Total Imports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Imports YoY Label]] @Measures_Table.Total Imports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Imports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Imports USD
  - [3a1da5dc6d617eb5e34b] cardVisual  pos=(226,107) size=(220x123) title=None
      Data: Measures_Table[[Total Exports USD]]  queryRef=Measures_Table.Total Exports USD displayName='Total Exports'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Exports YoY Label]] @Measures_Table.Total Exports USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Exports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Exports USD
  - [487f3daab26b27a13b83] cardVisual  pos=(450,107) size=(235x123) title=None
      Data: Measures_Table[[Target FX Savings USD]]  queryRef=Measures_Table.Target FX Savings USD displayName='Target FX Savings'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Savings Label]] @Measures_Table.Target FX Savings USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Target FX Savings USD
      obj:value.labelPrecision=1L @Measures_Table.Target FX Savings USD
  - [0e9c32f31100061e4634] cardVisual  pos=(689,107) size=(243x123) title=None
      Data: Measures_Table[[Total Required CapEx USD]]  queryRef=Measures_Table.Total Required CapEx USD displayName='Required CapEx'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Payback Label]] @Measures_Table.Total Required CapEx USD
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Required CapEx USD
      obj:value.labelPrecision=1L @Measures_Table.Total Required CapEx USD
  - [e974463c164576874483] cardVisual  pos=(936,107) size=(243x123) title=None
      Data: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs displayName='New Jobs'
      obj:referenceLabel.value=MEASURE:Measures_Table[[Jobs Label]] @Measures_Table.Total New Jobs
      obj:value.labelDisplayUnits=1D @Measures_Table.Total New Jobs
      obj:value.labelPrecision=0L @Measures_Table.Total New Jobs
  - [b5d9bf20ab6c71324e69] cardVisual  pos=(1183,107) size=(243x123) title=None
      Data: Measures_Table[[Payback Period (Years)]]  queryRef=Measures_Table.Payback Period (Years) displayName='Payback (Yrs)'
  - [105fe5573777dae83755] cardVisual  pos=(1430,107) size=(243x123) title=None
      Data: Measures_Table[[Avg Export RCA]]  queryRef=Measures_Table.Avg Export RCA
  - [4f8c54ecb42b49d0ac8c] cardVisual  pos=(1677,107) size=(243x123) title=None
      Data: Measures_Table[[Priority Score]]  queryRef=Measures_Table.Priority Score
  - [514880f07232243e9c4c] cardVisual  pos=(0,229) size=(461x115) title=None
      Data: Max(Dim_Products[Sector])  queryRef=Min(Dim_Products.Sector)
  - [878902316d1a1502a6a9] cardVisual  pos=(684,229) size=(461x115) title=None
      Data: Max(Dim_Products[Localization Priority])  queryRef=Min(Dim_Products.Localization Priority)
  - [4296e90dc924d8cb6010] cardVisual  pos=(1460,231) size=(461x113) title=None
      Data: Max(Dim_Industrial_Opportunity[Golden License Eligible])  queryRef=Min(Dim_Industrial_Opportunity.Golden License Eligible) displayName='Golden License Eligible'
  - [0e1cf819c60d1a67e4d3] gauge  pos=(0,344) size=(597x319) title='Substitution Score'
      Y: Measures_Table[[Avg Substitution Score]]  queryRef=Measures_Table.Avg Substitution Score
      obj:axis.min=0D
      obj:axis.max=100D
      vco:subTitle.show=false
  - [dbea05be81a3db3a868d] clusteredBarChart  pos=(624,344) size=(614x319) title='Import Sources by Country (Top 10, M USD)'
      Category: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Partner Country'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Imports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='49109afa025c3a916275'
      FILTER: Dim_Countries[Partner Country] type=TopN
  - [a85c857a8086350d70ba] clusteredColumnChart  pos=(1275,344) size=(645x319) title='Capacity Gap vs Customs Protection vs Local Content (%)'
      Y: Measures_Table[[Avg Capacity Gap %]]  queryRef=Measures_Table.Avg Capacity Gap %
      Y: Measures_Table[[Avg Customs Protection %]]  queryRef=Measures_Table.Avg Customs Protection %
      Y: Measures_Table[[Avg Local Content %]]  queryRef=Measures_Table.Avg Local Content %
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Average (%)'
      vco:title.show=true
      vco:subTitle.show=false
  - [46ced2bbe600c0acbaae] lineClusteredColumnComboChart  pos=(27,663) size=(875x418) title='Product Trade Trend (M USD)'
      Category: Dim_Date[Year]  queryRef=Dim_Date.Year
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      Y2: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Imports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      obj:y2Axis.showAxisTitle=true
      obj:y2Axis.titleText='Exports (M USD)'
      obj:y2Axis.secondaryStart=0D
      obj:y2Axis.labelDisplayUnits=1D
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Year'
      vco:title.show=true
      vco:subTitle.show=false
  - [da9ea92a98de2c90ecc6] ribbonChart  pos=(915,663) size=(1005x418) title='Export Destinations by Country (Top 8, M USD)'
      Category: Dim_Date[Year]  queryRef=Dim_Date.Year
      Series: Dim_Countries[Partner Country]  queryRef=Dim_Countries.Partner Country
      Y: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:categoryAxis.showAxisTitle=true
      obj:categoryAxis.titleText='Year'
      obj:valueAxis.showAxisTitle=true
      obj:valueAxis.titleText='Exports (M USD)'
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      vco:visualTooltip.section='49109afa025c3a916275'
      FILTER: Dim_Countries[Partner Country] type=TopN

# PAGE 8: Product Tooltip  [1b7d1941d295c08cd640]  type=Tooltip size=400x300 vis=HiddenInViewMode
  - [aa097c96dbe5a4016096] cardVisual  pos=(0,0) size=(193x51) title=None
      Data: Measures_Table[[Total Imports USD]]  queryRef=Measures_Table.Total Imports USD displayName='Total Imports'
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Imports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Imports USD
  - [8bd57a0d111693607988] cardVisual  pos=(207,0) size=(193x51) title=None
      Data: Measures_Table[[Total Exports USD]]  queryRef=Measures_Table.Total Exports USD displayName='Total Exports'
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Exports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Exports USD
  - [f28c13490190a4c32038] cardVisual  pos=(0,50) size=(193x51) title=None
      Data: Measures_Table[[Target FX Savings USD]]  queryRef=Measures_Table.Target FX Savings USD displayName='Target FX Savings'
      obj:value.labelDisplayUnits=0D @Measures_Table.Target FX Savings USD
      obj:value.labelPrecision=1L @Measures_Table.Target FX Savings USD
  - [255ce33176a0301a7c70] cardVisual  pos=(207,50) size=(193x51) title=None
      Data: Measures_Table[[Total New Jobs]]  queryRef=Measures_Table.Total New Jobs displayName='New Jobs'
      obj:value.labelDisplayUnits=1D @Measures_Table.Total New Jobs
      obj:value.labelPrecision=0L @Measures_Table.Total New Jobs
  - [061c957450d28cb91b11] lineClusteredColumnComboChart  pos=(0,101) size=(400x199) title='Product Trade Trend (M USD)'
      Category: Dim_Date[Year]  queryRef=Dim_Date.Year
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      Y2: Measures_Table[[Total Exports (M USD)]]  queryRef=Measures_Table.Total Exports (M USD)
      obj:y2Axis.secondaryStart=0D
      obj:y2Axis.labelDisplayUnits=1D
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false

# PAGE 9: Country Tooltip  [49109afa025c3a916275]  type=Tooltip size=400x300 vis=HiddenInViewMode
  - [f5719591d200661d78d5] cardVisual  pos=(0,0) size=(200x51) title=None
      Data: Measures_Table[[Total Imports USD]]  queryRef=Measures_Table.Total Imports USD displayName='Total Imports'
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Imports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Imports USD
  - [6be895408823a4040371] cardVisual  pos=(200,0) size=(200x51) title=None
      Data: Measures_Table[[Total Exports USD]]  queryRef=Measures_Table.Total Exports USD displayName='Total Exports'
      obj:value.labelDisplayUnits=0D @Measures_Table.Total Exports USD
      obj:value.labelPrecision=1L @Measures_Table.Total Exports USD
  - [d5c3833ae0aeb89b7720] cardVisual  pos=(0,51) size=(200x53) title=None
      Data: Measures_Table[[Country Share of Imports %]]  queryRef=Measures_Table.Country Share of Imports % displayName='Share of Imports'
  - [bcd5b4fc9db60be4509e] cardVisual  pos=(200,51) size=(200x53) title=None
      Data: Measures_Table[[Estimated Tariff Revenue USD]]  queryRef=Measures_Table.Estimated Tariff Revenue USD displayName='Estimated Tariff Revenue'
      obj:value.labelDisplayUnits=0D @Measures_Table.Estimated Tariff Revenue USD
      obj:value.labelPrecision=1L @Measures_Table.Estimated Tariff Revenue USD
  - [5b319760d00d3253a3e6] clusteredBarChart  pos=(0,104) size=(400x196) title='Top 5 Sectors with this Partner (M USD)'
      Category: Dim_Products[Sector]  queryRef=Dim_Products.Sector
      Y: Measures_Table[[Total Imports (M USD)]]  queryRef=Measures_Table.Total Imports (M USD)
      obj:labels.show=true
      obj:labels.labelDisplayUnits=1D
      obj:valueAxis.labelDisplayUnits=1D
      vco:title.show=true
      vco:subTitle.show=false
      FILTER: Dim_Products[Sector] type=TopN
```
