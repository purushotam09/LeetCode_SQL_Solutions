/* Write your T-SQL query statement below */
with cte as (
    select t.visited_on,sum(t.amount) over(order by t.visited_on asc rows between 6 preceding and current row) as last_6daysum from (select visited_on,sum(amount) as amount from Customer group by visited_on) as t
)select visited_on, sum(last_6daysum) as amount,round(sum(last_6daysum)*1.0/7,2) as average_amount from cte group by visited_on order by visited_on asc offset 6 rows;