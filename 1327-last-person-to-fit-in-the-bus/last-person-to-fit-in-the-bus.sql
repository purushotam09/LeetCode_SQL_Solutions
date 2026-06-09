/* Write your T-SQL query statement below */
with cte as (
    select *,sum(q.weight) over(order by q.turn asc rows between unbounded preceding and current row) as Running_total from Queue q
)select top 1 person_name from cte where Running_total <= 1000 order by turn desc;