# Run Sunny’s résumé projects on a local PC (Windows)

Three résumé projects live under this folder. **Sales** uses two GitHub repos (Excel + Python); **Executive** and **HR** use one each.

| Résumé # | Local folder | GitHub |
|----------|--------------|--------|
| 1 Sales (Excel) | `sales-data-analysis/` | https://github.com/Deekshith254/sales-data-analysis |
| 1 Sales (Python) | `python-sales-analysis/` | https://github.com/Deekshith254/python-sales-analysis |
| 2 Executive Sales | `executive-sales-insights-dashboard/` | https://github.com/Deekshith254/executive-sales-insights-dashboard |
| 3 HR Attrition | `hr-attrition-workforce-analytics/` | https://github.com/Deekshith254/hr-attrition-workforce-analytics |

---

## Prerequisites (install once)

| Tool | Used in | Install |
|------|---------|---------|
| **Microsoft Excel** | Project 1 | Office / Excel desktop |
| **Python 3.11+** | Projects 1–3 scripts | https://www.python.org/downloads/ (check “Add to PATH”) |
| **Power BI Desktop** (free) | Projects 2 & 3 real `.pbix` | Microsoft Store or https://powerbi.microsoft.com/desktop/ |
| **SQL client** (optional) | Project 2 | Azure Data Studio, DBeaver, or SSMS |

Python packages (from `projects` root):

```powershell
cd C:\Users\rajjk\git_projects\Jobs_Automation\data\Resumes\Naukri\Sunny\projects
python -m pip install matplotlib openpyxl jupyter
```

---

## Clone from GitHub (another PC)

```powershell
mkdir C:\SunnyProjects
cd C:\SunnyProjects
git clone https://github.com/Deekshith254/sales-data-analysis.git
git clone https://github.com/Deekshith254/python-sales-analysis.git
git clone https://github.com/Deekshith254/executive-sales-insights-dashboard.git
git clone https://github.com/Deekshith254/hr-attrition-workforce-analytics.git
```

---

## Project 1 — Sales Performance & Profitability

### Excel (`sales-data-analysis`)

1. Open `Sales_Data_Analysis.xlsx` in Excel.
2. Follow cleaning / pivots described in `docs/EXCEL_STEPS.md` and `RESUME_ALIGNMENT.md`.

### Python (`python-sales-analysis`)

```powershell
cd python-sales-analysis
python -m pip install -r requirements.txt
python src/sales_eda.py
```

- **Output:** `output/resume_charts_2x2.png`, `output/analysis_summary.txt`
- **Notebook:** `jupyter notebook Sales_Analysis_Python.ipynb`

---

## Project 2 — Executive Sales Insights (Power BI & SQL)

### Regenerate data & dashboard PNG (no Power BI required)

```powershell
cd C:\...\Sunny\projects
python scripts\generate_datasets.py
python scripts\generate_dashboard_images.py
python scripts\write_sql_output_sample.py
```

- **SQL logic:** run scripts in `sql/` (e.g. `star_schema_joins.sql`, `top_segments_analysis.sql`) after loading `data/sales_transactions.csv` into your DB.
- **Text output:** `output/top_segments_report.txt`
- **Dashboard preview PNG:** `powerbi/screenshots/executive_dashboard_summary.png`

### Build in Power BI Desktop (full résumé experience)

1. Open **Power BI Desktop** → **Get data** → **Text/CSV** → `data/sales_transactions.csv`.
2. Import dimension CSVs from `data/dim_*.csv` (or build **Date** table from `order_date`).
3. Model: star schema — see `powerbi/star_schema_model.md`.
4. **Modeling** → **New measure** — paste from `powerbi/dax_measures.dax`.
5. Build pages per `docs/power_bi_pages.md` (slicers: Region, Category, Date).
6. **File → Save as** `Executive_Sales_Insights.pbix` (keep locally or add to repo if size allows).

---

## Project 3 — HR Attrition (Power BI & Excel)

```powershell
cd C:\...\Sunny\projects
python scripts\generate_datasets.py
python scripts\generate_dashboard_images.py
python scripts\write_hr_output_sample.py
```

- **Excel:** open `excel/HR_Attrition_Pivot.xlsx`
- **Text output:** `output/attrition_by_role.txt`
- **Dashboard preview PNG:** `powerbi/screenshots/hr_attrition_dashboard_summary.png`

### Power BI Desktop

1. **Get data** → `data/hr_employee_records.csv`
2. **Power Query** steps: `powerquery/m_transform_notes.md` (age bands, attrition flag)
3. Measures: `powerbi/dax_kpis.dax`
4. Layout: `docs/power_bi_pages.md`, drill-through: `docs/drillthrough_tooltips.md`

---

## One command — refresh all generated outputs

```powershell
cd C:\Users\rajjk\git_projects\Jobs_Automation\data\Resumes\Naukri\Sunny\projects
python scripts\generate_datasets.py
python scripts\generate_dashboard_images.py
python scripts\write_sql_output_sample.py
python scripts\write_hr_output_sample.py
python python-sales-analysis\src\sales_eda.py
```

---

## About screenshots in GitHub

Repos include **matplotlib dashboard PNGs** under `powerbi/screenshots/` so recruiters see visuals without opening `.pbix`. If Sunny builds the official report in class, replace PNGs with **File → Export** from Power BI for a perfect match.

See `MISSING_FOR_RESUME.md` for optional swaps (real `.pbix`, class screenshots).
