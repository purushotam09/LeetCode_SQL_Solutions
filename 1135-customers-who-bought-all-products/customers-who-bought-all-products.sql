/* Write your T-SQL query statement below 
select distinct customer_id from Customer except 
select distinct customer_id from ((select distinct c.customer_id , p.product_key from Customer c cross join Product p) except (select distinct customer_id,product_key from Customer)) as t;*/
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*) FROM Product
);