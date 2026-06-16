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


/*

with cte1 as (select t1.*,t2.category, (case when month(t1.sale_date) in (12,1,2) then 'Winter' when month(t1.sale_date) in (3,4,5) then 'Spring' when month(t1.sale_date) in (6,7,8) then 'Summer' else 'Fall' end) as season from sales t1 inner join products t2 on t1.product_id = t2.product_id ),cte2 as (
    select distinct season from cte1
)
select cte2.season as season,a.category as category,a.total_quantity as total_quantity,a.total_revenue as total_revenue from cte2 outer apply (select top 1 cte1.season as season,cte1.category as category, sum(cte1.quantity) as total_quantity, sum(cte1.quantity*cte1.price) as total_revenue from cte1 where cte1.season = cte2.season group by cte1.season,cte1.category order by sum(cte1.quantity) desc,sum(cte1.quantity*cte1.price) desc ) as a

*/