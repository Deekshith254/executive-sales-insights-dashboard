-- Category × sales rep leaderboard with window functions

WITH base AS (
    SELECT
        product_category,
        sales_rep,
        SUM(quantity * unit_price * (1 - discount_pct / 100.0)) AS revenue,
        SUM(
            quantity * unit_price * (1 - discount_pct / 100.0) - quantity * unit_cost
        ) AS profit
    FROM sales_transactions
    GROUP BY product_category, sales_rep
)
SELECT
    product_category,
    sales_rep,
    revenue,
    profit,
    DENSE_RANK() OVER (
        PARTITION BY product_category
        ORDER BY revenue DESC
    ) AS rep_rank_in_category
FROM base
QUALIFY rep_rank_in_category <= 5
ORDER BY product_category, rep_rank_in_category;

-- Note: QUALIFY is supported in Snowflake/BigQuery; for PostgreSQL use nested query or ROW_NUMBER() in outer filter.
