/* Write your T-SQL query statement below */
WITH cte1 AS (
    SELECT 
        t1.*,
        t2.category,
        CASE 
            WHEN MONTH(t1.sale_date) IN (12,1,2) THEN 'Winter'
            WHEN MONTH(t1.sale_date) IN (3,4,5) THEN 'Spring'
            WHEN MONTH(t1.sale_date) IN (6,7,8) THEN 'Summer'
            ELSE 'Fall'
        END AS season
    FROM sales t1
    INNER JOIN products t2
        ON t1.product_id = t2.product_id
),
cte2 AS (
    SELECT 
        season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM cte1
    GROUP BY season, category
),
cte3 AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY season
               ORDER BY total_quantity DESC, total_revenue DESC
           ) AS rn
    FROM cte2
)
SELECT 
    season,
    category,
    total_quantity,
    total_revenue
FROM cte3
WHERE rn = 1;