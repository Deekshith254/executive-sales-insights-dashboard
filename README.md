# Executive Sales Insights Dashboard

**Author:** Salimeda Deekshith  
**Tools:** SQL (joins, CTEs, window functions), Power BI (star schema, DAX)

Resume project: extract and analyze **5,000+** transactional sales rows for executive reporting.

## Repository layout

| Path | Description |
|------|-------------|
| `data/sales_transactions.csv` | 5,200-row synthetic sales fact extract |
| `sql/` | Staging, star-style extracts, top-segment ranking queries |
| `powerbi/` | Data model notes, DAX measures, build checklist |
| `docs/dashboard_wireframe.md` | Slicers, drill-down visuals, KPI layout |

## SQL workflow

Run against SQLite (or import CSV into PostgreSQL / SQL Server):

```powershell
cd sql
sqlite3 ../data/warehouse.db < 00_load_instructions.sql
```

Or open `sql/top_segments_analysis.sql` in your SQL client after loading `sales_transactions.csv`.

## Power BI

1. **Get Data** → `sales_transactions.csv` (or SQL connection).  
2. Model: single fact table `Sales` with date, region, category, rep dimensions (star schema).  
3. Copy measures from `powerbi/dax_measures.dax`.  
4. Add slicers: Region, Category, Date; card visuals for revenue and profit; line trend by month.

> `.pbix` files are not stored in Git (binary). This repo holds **data + SQL + DAX** so recruiters can reproduce the logic.

## Related

- Excel/Python sales EDA: [sales-data-analysis](https://github.com/Deekshith254/sales-data-analysis), [python-sales-analysis](https://github.com/Deekshith254/python-sales-analysis)

## License

MIT
