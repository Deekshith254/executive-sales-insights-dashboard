-- Executive Sales Insights — top segments with CTEs and window functions
-- Load sales_transactions.csv into your warehouse as sales_transactions (or use SQLite import).

WITH sales_enriched AS (
    SELECT
        order_id,
        CAST(order_date AS DATE) AS order_date,
        region,
        product_category,
        sales_rep,
        quantity,
        unit_price,
        unit_cost,
        discount_pct,
        quantity * unit_price * (1 - discount_pct / 100.0) AS gross_sales,
        quantity * unit_cost AS total_cost,
        quantity * unit_price * (1 - discount_pct / 100.0)
            - quantity * unit_cost AS profit
    FROM sales_transactions
),
monthly_region AS (
    SELECT
        DATE_TRUNC('month', order_date) AS sales_month,
        region,
        SUM(gross_sales) AS revenue,
        SUM(profit) AS profit
    FROM sales_enriched
    GROUP BY 1, 2
),
ranked AS (
    SELECT
        sales_month,
        region,
        revenue,
        profit,
        RANK() OVER (PARTITION BY sales_month ORDER BY revenue DESC) AS revenue_rank,
        SUM(revenue) OVER (
            PARTITION BY region
            ORDER BY sales_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS region_running_revenue
    FROM monthly_region
)
SELECT
    sales_month,
    region,
    revenue,
    profit,
    revenue_rank,
    region_running_revenue
FROM ranked
WHERE revenue_rank <= 3
ORDER BY sales_month, revenue_rank;
