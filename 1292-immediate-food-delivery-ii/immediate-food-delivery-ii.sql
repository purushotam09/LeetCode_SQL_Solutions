/* Write your T-SQL query statement below */
WITH cte AS (
    SELECT *,
           CASE 
               WHEN order_date = customer_pref_delivery_date 
               THEN 'immediate' 
               ELSE 'scheduled' 
           END AS flag
    FROM Delivery
)
SELECT 
    ROUND(
        SUM(CASE WHEN k.flag = 'immediate' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS immediate_percentage
FROM (
    SELECT DISTINCT customer_id 
    FROM Delivery
) AS d
CROSS APPLY (
    SELECT TOP 1 customer_id, order_date, flag
    FROM cte
    WHERE cte.customer_id = d.customer_id
    ORDER BY order_date ASC
) AS k;