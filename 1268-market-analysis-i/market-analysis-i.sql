/* Write your T-SQL query statement below */
/*select o.buyer_id, u.join_date, count(*) as orders_in_2019
from Users u inner join Orders o on u.user_id = o.buyer_id where datepart(year,o.order_date)='2019' group by o.buyer_id,u.join_date;*/
SELECT
    u.user_id AS buyer_id,
    u.join_date,
    SUM(
        CASE
            WHEN DATEPART(YEAR, o.order_date) = 2019
            THEN 1
            ELSE 0
        END
    ) AS orders_in_2019
FROM Users u
LEFT JOIN Orders o
    ON u.user_id = o.buyer_id
GROUP BY
    u.user_id,
    u.join_date;