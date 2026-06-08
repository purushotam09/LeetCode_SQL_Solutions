/* Write your T-SQL query statement below */
with cte as (
    select product_id,max(change_date) as change_date from Products where change_date <= '2019-08-16' group by product_id
) select p.product_id,isnull(p.new_price,10) as price from Products p inner join cte c on p.product_id = c.product_id and p.change_date = c.change_date union 
select product_id,10 from Products where product_id not in (select product_id from cte)