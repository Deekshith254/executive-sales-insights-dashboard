# Build the Power BI dashboard (step by step)

**In short:** Install Power BI → load the CSV files from `data/` → add measures from `dax_measures.dax` → build pages → save `.pbix` and export a PNG.

---

## 1. Install Power BI Desktop (free)

[powerbi.microsoft.com/desktop](https://powerbi.microsoft.com/desktop/) or Microsoft Store.

## 2. Load the data

1. Open Power BI Desktop.
2. **Home → Get data → Text/CSV**
3. Pick these files from **this repo’s `data/` folder**:
   - `sales_transactions.csv` (main sales table)
   - `dim_region.csv`, `dim_product_category.csv`, `dim_sales_rep.csv`, `dim_date.csv`
4. Set column types (numbers, dates) in Power Query if needed → **Close & Apply**.

## 3. Connect tables (relationships)

Link `sales_transactions` to the small `dim_*` tables so you can slice by region, category, rep, and date.

More detail (optional): `star_schema_model.md`

## 4. Add KPI measures

**Modeling → New measure** — copy lines from **`dax_measures.dax`** (revenue, profit, margin, YTD, etc.).

## 5. Build the report

Ideas for pages and charts: **`docs/power_bi_pages.md`**

- Slicers: Region, Category, Date  
- Cards for totals  
- Line chart for sales over time  

## 6. Save for GitHub

1. **File → Save as** → `powerbi/reports/Executive_Sales_Insights.pbix`
2. **File → Export → PNG** → save in `powerbi/screenshots/`

Use screenshots **only** from Power BI (not from Python or other tools).
