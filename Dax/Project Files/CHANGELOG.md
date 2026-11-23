# التعديلات والمراجعة (الدفعات 1 و2 و3)

## 1) طريقة التطبيق

1. **انسخ فولدر المشروع كله** كنسخة احتياطية (فولدر الـ `.pbip` بالـ Report والـ SemanticModel).
2. فك `Final_changed_files.zip` **جوه نفس فولدر المشروع** واختار **Replace**. الـ ZIP **تراكمي** (فيه كل تعديلات الدفعات الثلاثة)، فينفع تفكه فوق المشروع الأصلي أو فوق أي دفعة طبقتها قبل كده. وهو 96 ملف متعدل بس ومفيهوش الـ cache فمش هيمسح بياناتك.
3. افتح ملف `.pbip`. **متوقع** يطلب Apply changes أو Refresh أول مرة (أسماء أعمدة اتغيرت وعمود جديد اتضاف). ملفات الـ Excel لازم تكون موجودة في `D:\Career\Data Analysis\DEPI\Team Project\Tables\`.
4. لو ظهرت رسالة خطأ ابعتلي نصها. ولو عايز ترجع امسح الفولدر وارجع للنسخة الاحتياطية.

## 2) إيه اللي هتشوفه (قايمة فحص سريعة)

| الصفحة | المفروض يظهر |
|---|---|
| Import Invoice | كروت `$46.9bn` و`$26.7bn` و`-$20.2bn` و`$2.6bn`، وعناوين بدون `(M USD)` أو `%`. شارت الدول (Top 10) وشارت المنتجات بعنوان فيه الوحدة ودata labels |
| Export Opportunities | الـ Funnel بقى bar chart، وعناوين المحاور في الـ scatter |
| Localization Plan | الأولوية High ثم Medium ثم Low، وعناوين للشارتات اللي كانت من غير عنوان |
| Recommendations & Analysis | محور الـ growth chart بعلامة minus تحت الصفر، وكروت `Imports CAGR '21–'25` |
| Country Details (China) | `$13.2bn` و`-$12.0bn` والـ quarterly بـ Q1 إلى Q4، وكارت العنوان من غير كلمة Country Title |
| Product Details (Garments) | `$15.6M` و`$2.2bn`، الـ gauge من 0 لـ 100، وشارت Import Sources و Ribbon محدودين بـ Top N |
| كل الصفحات | الأعداد بفواصل (37,298) والنسب بخانة عشرية واحدة (56.9%) والـ Auto units على المبالغ |
| كل الـ charts | عنوان X وY ظاهر، ومحاور الـ (M USD) أرقامها كاملة من غير K/M |

## 3) الدفعة 1: الـ Model

### أسماء الأعمدة (36 عمود)

الـ underscore بيتحول لمسافة. الـ keys (`Product_ID` وأخواتها) والعمود المساعد `Localization_Priority_Sort` فضلوا زي ما هما ومخفيين. الـ `sourceColumn` ماتغيرش فربط الـ Excel سليم، واتحدثت كل المراجع (DAX والـ visuals والـ drill-through وبيانات Q&A).

| الجدول | القديم | الجديد |
|---|---|---|
| Fact_Trade_Transactions | `Trade_Flow` | `Trade Flow` |
| Fact_Trade_Transactions | `Unit_Price_USD` | `Unit Price USD` |
| Fact_Trade_Transactions | `Total_Value_USD` | `Total Value USD` |
| Fact_Trade_Transactions | `Partner_Global_Demand_USD` | `Partner Global Demand USD` |
| Dim_Products | `HS_Code` | `HS Code` |
| Dim_Products | `Product_Name` | `Product Name` |
| Dim_Products | `Product_Category` | `Product Category` |
| Dim_Products | `Supply_Chain_Stage` | `Supply Chain Stage` |
| Dim_Products | `Value_Chain_Group` | `Value Chain Group` |
| Dim_Products | `Industry_Complexity` | `Industry Complexity` |
| Dim_Products | `Estimated_CapEx_Tier` | `Estimated CapEx Tier` |
| Dim_Products | `Product_Essentiality` | `Product Essentiality` |
| Dim_Products | `Local_Raw_Material` | `Local Raw Material` |
| Dim_Products | `Localization_Priority` | `Localization Priority` |
| Dim_Products | `Commodity_Trade_Class` | `Commodity Trade Class` |
| Dim_Countries | `Partner_Country` | `Partner Country` |
| Dim_Countries | `Trade_Agreement` | `Trade Agreement` |
| Dim_Countries | `Tariff_Rate_Pct` | `Tariff Rate Pct` |
| Dim_Ports | `Port_Name` | `Port Name` |
| Dim_Ports | `Port_Type` | `Port Type` |
| Dim_Date | `Month_Name` | `Month Name` |
| Dim_Industrial_Opportunity | `Local_Capacity_Gap_Pct` | `Local Capacity Gap Pct` |
| Dim_Industrial_Opportunity | `Local_Value_Added_Pct` | `Local Value Added Pct` |
| Dim_Industrial_Opportunity | `Import_Substitution_Score` | `Import Substitution Score` |
| Dim_Industrial_Opportunity | `Avg_Freight_Cost_Pct` | `Avg Freight Cost Pct` |
| Dim_Industrial_Opportunity | `Effective_Customs_Protection_Pct` | `Effective Customs Protection Pct` |
| Dim_Industrial_Opportunity | `Est_Factory_CapEx_M_USD` | `Est Factory CapEx M USD` |
| Dim_Industrial_Opportunity | `Direct_Jobs_Per_10M_USD` | `Direct Jobs Per 10M USD` |
| Dim_Industrial_Opportunity | `Export_RCA_Index` | `Export RCA Index` |
| Dim_Industrial_Opportunity | `Export_Rebate_Incentive_Pct` | `Export Rebate Incentive Pct` |
| Dim_Industrial_Opportunity | `Target_2030_Import_Cut_Pct` | `Target 2030 Import Cut Pct` |
| Dim_Industrial_Opportunity | `Golden_License_Eligible` | `Golden License Eligible` |
| Dim_Industrial_Opportunity | `Annual_Import_Avg_M_USD` | `Annual Import Avg M USD` |
| Dim_Industrial_Opportunity | `Target_Annual_FX_Savings_M_USD` | `Target Annual FX Savings M USD` |
| Dim_Industrial_Opportunity | `Required_Factories_Count` | `Required Factories Count` |
| Dim_Industrial_Opportunity | `Estimated_Total_New_Jobs` | `Estimated Total New Jobs` |

أسماء الجداول والـ measures ما اتغيرتش (بادئة Dim_ وFact_ اصطلاح معروف، و`Growth Gap :` اسمه بنقطتين قصدا عشان يظهر كعنوان).

### الترتيب

- `Localization Priority` بيترتب بالعمود المخفي `Localization_Priority_Sort` (كان موجود ومش متطبق). **تصحيح:** العمود ده كان معادلة DAX بتقرا من العمود اللي بيترتب بيه فطلع خطأ circular dependency لما فتحت الملف. دلوقتي بقى عمود عادي بيتحسب في Power Query (خطوة `Added Priority Sort` في Dim_Products)، فلازم Refresh عشان يتكون. `Month Name` بيترتب بـ `Month`.
- عمود جديد **`Quarter Name`** = `"Q" & [Quarter]` بيترتب بـ `Quarter`.
- `Year` و`Quarter` و`Month` و`Tariff Rate Pct` بقت summarize = none.

### الـ Formats

| النوع | الـ format | أمثلة |
|---|---|---|
| مبالغ بالدولار الكامل | `$#,0` والكروت بتعرضها bn/M/K بـ Auto units | Total Imports USD, Trade Balance |
| مبالغ بالمليون (charts وجداول) | `#,0.0` والوحدة في الاسم أو العنوان | Total Imports (M USD) |
| أعداد | `#,0` | Total New Jobs, Products (Count) |
| نسب | `0.0%` (بقت single section عشان علامة السالب تظهر في المحاور) | كل measures الـ % |
| مؤشرات | `0.00` للـ RCA والـ Score والـ Savings per $ CapEx، و`0.0` للـ Payback والـ Priority Score | Avg Export RCA |

### measures جديدة وإخفاء

- `Target FX Savings USD` و`Total Required CapEx USD` (دولار كامل عشان الكروت تعرض bn/M صح).
- **أعمدة مخفية:** كل الـ keys، `Fact[Date]`، الأعمدة الرقمية الخام في الـ Fact، كل أعمدة `Dim_Industrial_Opportunity` ما عدا `Golden License Eligible`، و`Month` و`Quarter`.
- **Measures مخفية (helpers):** `Imports PY`، `Exports PY`، `Trade Balance PY`، `Country Title`، `Product Title`، `Imports YoY Label`، `Exports YoY Label`، `Trade Position`، `Trade Balance Color`، `Advantage Share Label`، `Rebate Rate Label`، `Rebate Color`، `Savings Label`، `Payback Label`، `Jobs Label`، `Factory Label`، `Top Export Destination Label`، `Growth Gap :`، `Growth Gap Color`، `Priority Label`، `Top Import Partner Label`.

## 4) الدفعة 2: الكروت والـ Charts

### الكروت

- **29 كارت** على قاعدة الوحدات: 17 اتحولوا من (M USD) للدولار الكامل، 5 كروت دولار خام بقت Auto، 7 كروت أعداد بقت رقم كامل بفواصل. الدقة العشرية خانة واحدة.
- عناوين مختصرة بدون وحدة أو علامة %: `Total Imports` و`Export Coverage Ratio` و`Advantage Products` و`Required Factories` و`New Jobs` و`Payback (Yrs)` و`Imports CAGR '21–'25` وغيرها.
- كروت "First ..." بقت `Region` و`Trade Agreement` و`Golden License Eligible`. وكروت العنوان (Country Title وProduct Title) اتشال منها اسم الـ measure.
- النصوص: `Factory Label` بقى `$30.7M saved per factory` بدل `M USD`، و`Advantage Share Label` بخانة عشرية، و`Savings Label` بقى "of annual import baseline".

### الـ Charts (32 visual)

- **عناوين فيها الوحدة** لكل chart على (M USD)، وعناوين جديدة للـ charts اللي كانت من غير عنوان.
- **Data labels** على الـ charts الناقصة، بوحدة ثابتة للـ chart كله (M USD بدون display units) فمفيش خلط بين K وM.
- **Top N**: الـ donut في Import Invoice (Top 10)، وImport Sources (Top 10)، والـ Ribbon (Top 8).
- **الـ Funnel** بقى clustered bar. **الـ Gauge** من 0 لـ 100 (افتراض مني من معادلة الـ Priority Score وحد الـ 70 في High Priority، لو الـ score عندك بيتعدى 100 غيّر الـ Max).
- **عناوين المحاور** للـ scatter والـ combo charts والـ Pareto (والمحور التاني 0 لـ 100%).
- **Quarterly** بقى "Seasonality: Trade Volume by Quarter (all years)" بمحور Q1 إلى Q4 وData labels بـ Auto units.

### خصائص مش متأكد إن Power BI هياخدها

مقدرتش أجربها على Desktop، وأسماءها مش موجودة في ملفاتك فاعتمدت على معرفتي بالـ JSON. لو واحدة منها ماظهرتش عندك، Power BI بيتجاهلها من غير خطأ، وبتتعمل يدوي في ثواني من Format pane:

- `y2Axis.secondaryStart/secondaryEnd` (بداية المحور التاني من 0 في الـ Pareto وProduct Trade Trend).
- `showAxisTitle` على المحاور (عناوين المحاور).
- `axis.min/max` للـ Gauge.
- `labels.show` على الـ treemap.

## 5) خطوات يدوية سريعة (دقيقة لكل صفحة)

**عنوان الـ reference label في الكروت** (زي "Exports YoY Label" قبل القيمة): ملقتش اسم الخاصية في ملفاتك فمش هخمنه. حدد كل الكروت في الصفحة بـ Ctrl+click، وبعدين Format → Reference labels → **Title: Off**. استثنِ كارت Imports CAGR عشان فيه `Growth Gap :` وده عنوان مقصود.

## 6) نتايج المراجعة

### تصحيح لملاحظات قلتها قبل كده من الـ screenshots

- **"% of import baseline" (50.6%)**: صح. الـ baseline هو متوسط الواردات السنوي والوفورات سنوية: 4,756 ÷ ~9,370 = 50.7%. وأنا كنت قسمتها على إجمالي 5 سنين غلط.
- **النصوص الديناميكية** (سنة المقارنة وSurplus/Deficit وسهم ▲/▼) كلها محسوبة بـ DAX ومش ثابتة.
- **الـ Pareto** محسوب على كل المنتجات (`ALL(Product Name)`) مش على الـ Top 15.
- **Jobs per $M (7.6)**: الكود بيحسب 37,298 ÷ 4,756.3 = 7.84، فغالبا قراية غلط مني من الصورة.
- **Exports YoY (6.6%)**: الكارت والشارت بيستخدموا نفس الـ measure، فلو الرقمين مختلفين على شاشتك فالسبب في سياق الفلاتر. اتأكد بالـ query في القسم 7.

### مشاكل حقيقية

1. **صفحة Overview فاضية تماما** (0 visuals) وهي الأولى في الترتيب. دي الصفحة التاسعة اللي كانت ناقصة.
2. عمود ترتيب الأولوية كان موجود ومش متطبق (اتصلح).
3. الـ Auto date/time لسه شغال (`LocalDateTable` و`DateTableTemplate` مخفيين) رغم وجود `Dim_Date`. الأفضل تقفله من File → Options → Current File → Data load. ما عدّلتهوش.
4. مصادر البيانات مسارات مطلقة على `D:\Career\...` فمفيش Refresh على جهاز تاني من غير تغيير المسار.
5. `Imports CAGR` و`Exports CAGR` مكتوب فيهم 2021 و2025 ثابتين في الـ DAX (مناسب للداتا الحالية بس).
6. measures مكررة المعنى: `products Count` و`Products (Count)`، ونسخ (M USD) و(USD) لنفس القيمة.
7. **الـ Treemaps**: المربعات الصغيرة من غير labels، والـ "Others" مش اتعمل (محتاج measure أو grouping).
8. الخريطة من غير legend.

### measures مش مستخدمة في أي visual (34) ومش اتمسحت

`Import Share %`، `Weighted Capacity Gap %`، `Avg 2030 Import Cut Target %`، `Golden License Products`، `Savings Rank`، `Avg Annual Imports (M USD)`، `CapEx per Job (USD)`، `Avg Direct Jobs per 10M USD`، `Total Freight Cost USD`، `Import Freight Cost USD`، `Freight % of Imports`، `Avg Freight Cost %`، `Selected Year Label`، `Total Quantity`، `Avg Unit Price USD`، `Avg Transaction Value USD`، `Imports YTD`، `Q1+Q4 Share of Trade %`، `Preferential Agreement Imports USD`، `Port Share %`، `Local Raw Material Imports USD`، `High Localization Priority Imports USD`، `Import-Heavy Products`، `Export Market Share of Partner Demand %`، `Imports per Job (M USD)`، `Trade Balance PY`، `Trade Balance YoY Change`، `Imports QoQ %`، `Import Share of Trade %`، `Export Share of Trade %`، `Value Calc Error Rows`، `Anomaly Products`، `Rebate Color`، `Estimated Tariff Revenue (M USD)`

## 7) استعلام التأكد من الأرقام

شغّله في DAX query view وابعتلي النتيجة:

```dax
EVALUATE
ROW(
    "Exports YoY 2025", CALCULATE([Exports YoY %], Dim_Date[Year] = 2025),
    "Imports YoY 2025", CALCULATE([Imports YoY %], Dim_Date[Year] = 2025),
    "Exports 2025 (M)", CALCULATE([Total Exports (M USD)], Dim_Date[Year] = 2025),
    "Exports 2024 (M)", CALCULATE([Total Exports (M USD)], Dim_Date[Year] = 2024),
    "New Jobs", [Total New Jobs],
    "FX Savings (M)", [Target FX Savings (M USD)],
    "Jobs per M USD", [Jobs per M USD Savings],
    "Savings % baseline", [Savings as % of Imports],
    "Products (Dim_Products)", [Products (Count)],
    "Products (Opportunity)", [products Count],
    "Value calc error rows", [Value Calc Error Rows],
    "Anomaly products", [Anomaly Products],
    "Import + Export share", [Import Share of Trade %] + [Export Share of Trade %]
)
```

## 8) تعريفات المقاييس الغامضة (من الكود)

الصقها في Model view → اختار الـ measure → Properties → Description، وبتظهر لما تقف على الـ measure في الـ Fields pane:

| المقياس | التعريف |
|---|---|
| `Strategic Imports Share %` | حصة واردات المنتجات المصنفة Strategic / Essential من إجمالي الواردات. |
| `Golden License Savings %` | نسبة الوفورات المستهدفة للمنتجات المؤهلة للرخصة الذهبية من إجمالي الوفورات. |
| `Avg Substitution Score` | متوسط درجة إحلال الواردات من 100. |
| `Priority Score` | 0.4 × (وفورات المنتج ÷ أعلى وفورات) × 100 + 0.3 × فجوة القدرة المحلية % + 0.3 × درجة الإحلال. |
| `High Priority Products` | عدد المنتجات اللي درجة إحلالها 70 فأكتر وفجوة قدرتها المحلية 50% فأكتر. |
| `Export Advantage Products` | عدد المنتجات اللي ميزتها النسبية المعلنة (RCA) أكبر من 1. |
| `Export Opportunity Score` | RCA × (1 + نسبة الحافز التصديري)، للمنتجات اللي RCA بتاعها أكبر من 1 بس. |
| `Annual Import Baseline (M USD)` | مجموع متوسط الواردات السنوي للمنتجات. |
| `Savings as % of Imports` | الوفورات المستهدفة السنوية ÷ الـ baseline السنوي للواردات. |
| `Cumulative Savings %` | النسبة التراكمية للوفورات (Pareto) مرتبة تنازليا على كل المنتجات. |
| `Partner Market Size Index` | متوسط الطلب العالمي للشريك بالمليون، مؤشر نسبي وليس حجم تجارة مصر. |
| `Export Coverage Ratio %` | إجمالي الصادرات ÷ إجمالي الواردات. |
| `Estimated Tariff Revenue USD` | قيمة الواردات × معدل الجمارك لكل دولة. |
| `Export Rebate Value USD` | قيمة الصادرات × نسبة الحافز التصديري لكل منتج. |

## 9) الدفعة 3: المحاور والـ interactions

### عناوين المحاور X وY
- اتراجعت **23 chart** من حالة الـ JSON النهائية، والجدول الكامل في `Axis_Audit.md`. كل chart له عنوان X وعنوان Y (والمحور التاني في الـ combo) ماعدا كارتين الـ tooltip (400×300) عشان المساحة.
- **وحدة أرقام المحور:** كل chart قيمته (M USD) بقى محوره من غير اختصار (`1D`)، لأن الـ Auto كان بيكتب `10K` ومعناها 10 مليار، وده كان هيبوظ العنوان `(M USD)`.
- **المقارنة بين العنوان والـ measure:** فحصت إن كل عنوان فيه `M USD` على measures بالمليون فعلا، وإن مفيش chart بالمليون من غير الوحدة في عنوانه. مفيش تعارض.
- **خطوط المرجع:** `RCA = 1 (comparative advantage threshold)` و`Average Required CapEx` و`Overall Savings-to-CapEx ratio` بدل الأسماء الافتراضية.

### الـ Interactions
- **مزامنة الـ Year slicer:** ما اتعملتش من الملفات (جربتها وPower BI رفض مكان الخاصية في الملف)، فبتتعمل يدوي من القسم 10.
- **3 tooltips جديدة:** Import Sources by Country وExport Destinations (ribbon) بـ Country Tooltip، وTop Products Imported from this Country بـ Product Tooltip.
- **الـ Drill-through:** فحصت الـ binding للصفحتين (Partner Country لـ Country Details وProduct Name لـ Product Details) والفلتر المربوط موجود وصحيح.
- **الـ Tooltips:** كل visual بيستخدم tooltip من النوع المناسب لـ category بتاعته (منتج لـ Product Tooltip، دولة لـ Country Tooltip). مفيش تعارض.
- **Edit interactions:** مفيش أي إعداد مخصص في التقرير (كله default) ومفيش خطأ واضح يستدعي تغييره من غير ما أشوف التقرير شغال.

## 10) خطوات يدوية متبقية (دقيقة تقريبا)

1. **عنوان الـ reference label** في الكروت: حدد الكروت بـ Ctrl+click، ثم Format ← Reference labels ← Title: Off (استثنِ Imports CAGR).
2. **مزامنة الـ Year بين الصفحات:** افتح صفحة Import Invoice، وحدد الـ Year slicer، وبعدين View ← Sync slicers. علّم عمود **Sync** على Export Opportunities وCountry Details وProduct Details (عمود Visible ماتعلمهوش للصفحتين الأخيرتين).
3. لو **الـ Gauge** أو **المحور التاني** ما اتغيروش: Format ← Gauge axis (Min 0, Max 100)، وSecondary Y axis (Start 0).

## 11) قرارات ومحدوديات

- **صفحة Overview** سيبتها فاضية زي ما طلبت.
- **"Others"** في الـ donut والـ ribbon والـ treemap مش اتعمل (محتاج measure أو grouping)، فاستخدمت Top N بس.
- **الـ Auto date/time** والمسارات المطلقة لملفات الـ Excel محتاجين قرارك (القسم 6).
- **كل التعديلات دي اتفحصت بسكربتات** (JSON سليم، المراجع محلولة، الـ queryRef متطابق، مفيش أسماء قديمة، الـ overlay مطابق للمشروع). ما اتجربتش على Power BI Desktop، فالمراجعة النهائية بعينك هي اللي تأكد.
