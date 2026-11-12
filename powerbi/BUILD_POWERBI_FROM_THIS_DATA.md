# Build the real Power BI dashboard from this repo’s data

The **numbers and tables must come from this repository** (not the Python screenshot). After you build, save and export from Power BI only.

## 1. Install Power BI Desktop (free)

Microsoft Store: **Power BI Desktop**, or https://powerbi.microsoft.com/desktop/

## 2. Get data (paths in a cloned repo)

1. **Home → Get data → Text/CSV**
2. Import (use full path on your PC):

   - `data/sales_transactions.csv` (fact — 5,200 rows)
   - `data/dim_region.csv`
   - `data/dim_product_category.csv`
   - `data/dim_sales_rep.csv`
   - `data/dim_date.csv` → rename column to `Date`, mark as date table

3. **Power Query:** set types (numbers, dates). **Close & Apply**.

## 3. Model (star schema)

Relationships (many → one into fact):

| From (fact) | To (dim) | Column match |
|-------------|----------|--------------|
| `sales_transactions[region]` | `dim_region[region_name]` | *or use region_id if you merge in PQ* |
| `sales_transactions[product_category]` | `dim_product_category[category_name]` | |
| `sales_transactions[sales_rep]` | `dim_sales_rep[rep_name]` | |
| `sales_transactions[order_date]` | `dim_date[Date]` | |

Details: `powerbi/star_schema_model.md`

## 4. Measures

**Modeling → New measure** — paste each measure from `powerbi/dax_measures.dax` (`Total Revenue`, `Total Profit`, `Profit Margin %`, `Revenue YTD`, `Revenue PY`, `Revenue YoY %`).

## 5. Report page (matches project scope)

Layout: `docs/power_bi_pages.md`

- Slicers: Region, Product category, Date
- Cards: Total Revenue, Total Profit, Profit Margin %, Revenue YTD
- Line: monthly revenue (use `order_date` on axis)
- Matrix: Region → Category with drill

## 6. Save & publish to GitHub

1. **File → Save as** → `powerbi/reports/Executive_Sales_Insights.pbix`  
   (If `.pbix` is too large for Git, keep locally and export PNG only.)

2. **File → Export → Export to file → PNG** (current page or each page) into `powerbi/screenshots/` — **replace** any non–Power BI preview images.

3. Commit and push:

```powershell
cd executive-sales-insights-dashboard
git add powerbi/reports/ powerbi/screenshots/
git commit -m "Add Power BI report and exports from repo data"
git push
```

## 7. Verify against code

- SQL top segments: run `sql/star_schema_joins.sql` and compare to matrix totals.
- Text report: `output/top_segments_report.txt` (regenerate with `python ../scripts/write_sql_output_sample.py` from `projects/` root).

**Do not** commit Matplotlib `executive_dashboard_summary.png` as the Power BI deliverable — only **Export from Power BI** after this build.
