# Star schema — Executive Sales Insights (résumé)

Built in Power BI during certification — same design documented here.

## Tables

| Table | Type | Source in repo |
|-------|------|----------------|
| Sales | Fact | `data/sales_transactions.csv` |
| Date | Dimension | Calculated from `order_date` or `data/dim_date.csv` |
| Region | Dimension | `data/dim_region.csv` |
| ProductCategory | Dimension | `data/dim_product_category.csv` |
| SalesRep | Dimension | `data/dim_sales_rep.csv` |

## Relationships (many-to-one into Sales)

- `Region[region_id]` → `Sales[region_id]` *(or link on region name if single-table load)*
- `ProductCategory[category_id]` → `Sales[category_id]`
- `SalesRep[rep_id]` → `Sales[rep_id]`
- `Date[Date]` → `Sales[order_date]`

## Résumé items on this model

- **Dynamic slicers:** Region, Category, Date range on executive page  
- **Drill-down:** Matrix Region → Category → Rep; drill to order detail page  
- **DAX Time Intelligence:** measures in `dax_measures.dax` (YTD, prior year, YoY %)
