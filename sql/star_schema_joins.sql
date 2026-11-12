-- Executive Sales Insights — JOIN fact to dimensions (résumé: SQL joins + top segments)

WITH fact AS (
    SELECT
        f.order_id,
        CAST(f.order_date AS DATE) AS order_date,
        f.quantity,
        f.unit_price,
        f.unit_cost,
        f.discount_pct,
        r.region_id,
        r.region_name,
        c.category_id,
        c.category_name,
        rep.rep_id,
        rep.rep_name
    FROM sales_transactions f
    INNER JOIN dim_region r ON f.region = r.region_name
    INNER JOIN dim_product_category c ON f.product_category = c.category_name
    INNER JOIN dim_sales_rep rep ON f.sales_rep = rep.rep_name
),
enriched AS (
    SELECT
        *,
        quantity * unit_price * (1 - discount_pct / 100.0) AS gross_sales,
        quantity * unit_cost AS total_cost
    FROM fact
),
segment_totals AS (
    SELECT
        region_name,
        category_name,
        SUM(gross_sales) AS revenue,
        SUM(gross_sales - total_cost) AS profit,
        RANK() OVER (ORDER BY SUM(gross_sales) DESC) AS segment_rank
    FROM enriched
    GROUP BY region_name, category_name
)
SELECT
    region_name,
    category_name,
    revenue,
    profit,
    segment_rank
FROM segment_totals
WHERE segment_rank <= 10
ORDER BY segment_rank;
