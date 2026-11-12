# Executive Sales Insights

**Author:** Salimeda Deekshith  

Sales analytics project: **SQL** for segment analysis and a **Power BI** executive dashboard (star schema, DAX, slicers).

## Getting started

1. Explore **`data/sales_transactions.csv`** and dimension files in **`data/`**.
2. Review SQL examples in **`sql/`**.
3. To build the dashboard: install [Power BI Desktop](https://powerbi.microsoft.com/desktop/) and follow **`powerbi/BUILD_POWERBI_FROM_THIS_DATA.md`**.
4. Save the report under **`powerbi/reports/`** and export screenshots to **`powerbi/screenshots/`**.

## Outputs

| Output | How it is produced |
|--------|---------------------|
| SQL analysis results | Run queries in **`sql/`** in your SQL tool (SSMS, DBeaver, etc.) on the CSV data |
| Segment summary | **`output/top_segments_report.txt`** (derived from `data/sales_transactions.csv`) |
| Dashboard | **`powerbi/reports/*.pbix`** — built in Power BI per **`powerbi/BUILD_POWERBI_FROM_THIS_DATA.md`** |
| Screenshots | **File → Export → PNG** from Power BI into **`powerbi/screenshots/`** |

## Key files

| Path | Purpose |
|------|---------|
| `sql/` | Join and ranking queries |
| `powerbi/dax_measures.dax` | DAX measures |
| `powerbi/BUILD_POWERBI_FROM_THIS_DATA.md` | Dashboard build steps |
| `docs/power_bi_pages.md` | Report layout notes |
