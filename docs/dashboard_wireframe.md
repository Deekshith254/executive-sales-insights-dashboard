# Executive dashboard layout (Power BI)

## Pages

1. **Executive summary** — KPI cards: Total Revenue, Total Profit, Profit Margin %, YoY %.  
2. **Regional performance** — clustered bar: revenue by region; map or matrix optional.  
3. **Trend** — line chart: monthly revenue; drill to category.  
4. **Rep leaderboard** — table with conditional formatting on profit; Top N filter.

## Slicers

- Date range (relative)  
- Region (multi-select)  
- Product category (multi-select)

## Star schema (minimal)

| Table | Role | Keys |
|-------|------|------|
| Sales | Fact | order_id, date, region, category, rep, metrics |
| Date | Dimension | built from order_date |

Relationship: `Date[Date]` → `Sales[order_date]` (many-to-one).
