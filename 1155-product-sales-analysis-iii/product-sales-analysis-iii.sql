/* Write your T-SQL query statement below */
with cte as (
    select z.product_id,min(z.year) as firstyear from Sales z group by z.product_id
)
select s.product_id as product_id,s.year as first_year,s.quantity as quantity,s.price as price from cte t inner join Sales s
on t.product_id = s.product_id and s.year = t.firstyear;