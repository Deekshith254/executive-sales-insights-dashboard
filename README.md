# Executive Sales Insights Dashboard

**Author:** Salimeda Deekshith  
**Stack:** SQL, Power BI (star schema, DAX Time Intelligence)

End-to-end sales analytics on **5,000+** transactional rows: SQL segmentation, dimensional model, and executive KPI reporting.

## What this project covers

- SQL **joins**, **CTEs**, and **window functions** for top-performing segments
- Star-schema design, DAX measures (YTD / YoY), slicers, and drill-down layouts

## Repository contents

| Path | Description |
|------|-------------|
| `data/sales_transactions.csv` | Fact data (5,200 rows) |
| `data/dim_*.csv` | Dimension tables |
| `sql/` | Join and ranking queries |
| `powerbi/dax_measures.dax` | DAX Time Intelligence measures |
| `powerbi/BUILD_POWERBI_FROM_THIS_DATA.md` | **Build real `.pbix` from this repo’s CSV** |
| `powerbi/reports/` | Save `Executive_Sales_Insights.pbix` here |
| `powerbi/screenshots/` | **Only** PNG exports from Power BI (not Python charts) |
| `output/top_segments_report.txt` | Sample SQL/analytics output |
| `RUN_LOCALLY.md` | Setup and Power BI build steps |
