/* Write your T-SQL query statement below */
with cte as (
    select product_id,max(change_date) as change_date from Products where change_date <= '2019-08-16' group by product_id
) select p.product_id,p.new_price as price from Products p inner join cte c on p.product_id = c.product_id and p.change_date = c.change_date union 
select product_id,10 from Products where product_id not in (select product_id from cte)

/*One more safer habit: use NOT EXISTS instead of NOT IN when NULL may exist.But here product_id is part of primary key, so NOT IN is fine.*/

/*
WITH cte AS
(
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY product_id
               ORDER BY change_date DESC
           ) AS rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT product_id, new_price AS price
FROM cte
WHERE rn = 1

UNION

SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';
*/