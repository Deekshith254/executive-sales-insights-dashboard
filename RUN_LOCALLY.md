# Run these analytics projects locally (Windows)

**Author:** Salimeda Deekshith  

| Project | Folder / GitHub |
|---------|-----------------|
| Sales (Excel) | [sales-data-analysis](https://github.com/Deekshith254/sales-data-analysis) |
| Sales (Python) | [python-sales-analysis](https://github.com/Deekshith254/python-sales-analysis) |
| Executive Sales Dashboard | [executive-sales-insights-dashboard](https://github.com/Deekshith254/executive-sales-insights-dashboard) |
| HR Attrition Dashboard | [hr-attrition-workforce-analytics](https://github.com/Deekshith254/hr-attrition-workforce-analytics) |

## Prerequisites

- Microsoft **Excel**
- **Python 3.11+** and: `python -m pip install matplotlib openpyxl jupyter pandas`
- **Power BI Desktop** (free) for interactive dashboards

## Clone all repos

```powershell
mkdir C:\DataAnalyticsProjects
cd C:\DataAnalyticsProjects
git clone https://github.com/Deekshith254/sales-data-analysis.git
git clone https://github.com/Deekshith254/python-sales-analysis.git
git clone https://github.com/Deekshith254/executive-sales-insights-dashboard.git
git clone https://github.com/Deekshith254/hr-attrition-workforce-analytics.git
```

## Sales — Python

```powershell
cd python-sales-analysis
pip install -r requirements.txt
python src/sales_eda.py
```

## Sales — Excel

Open `Sales_Data_Analysis.xlsx` and follow `docs/EXCEL_STEPS.md`.

## Executive Sales — SQL & Power BI

1. Load `data/sales_transactions.csv` and `data/dim_*.csv`.
2. Run scripts in `sql/` in your SQL client.
3. Power BI: star schema per `powerbi/star_schema_model.md`; measures in `dax_measures.dax`.

Regenerate preview charts (if you cloned the parent `projects` scripts bundle):

```powershell
python scripts/generate_dashboard_images.py
```

## HR Attrition

1. Open `excel/HR_Attrition_Pivot.xlsx`.
2. Power BI: CSV + `powerquery/m_transform_notes.md` + `powerbi/dax_kpis.dax`.
