/* Write your T-SQL query statement below */
with cte as (
    select t1.employee_id as employee_id, t2.name as name, 
    t1.review_date, 
    row_number() over(partition by t1.employee_id order by t1.review_date desc) as rn, 
    t1.rating as rating 
        from performance_reviews as t1 left join employees t2 
            on t1.employee_id = t2.employee_id
)
,cte1 as (select * from cte where rn <= 3 )
,cte2 as (select cte1.employee_id as employee_id,cte1.name as name,
sum(case when rn = 1 then rating else null end) as day3,
sum(case when rn = 2 then rating else null end) as day2, 
sum(case when rn = 3 then rating else null end) as day1 
from cte1 group by cte1.employee_id,cte1.name)select employee_id,name,(day3 - day1) as improvement_score from cte2 where day1<day2 and day2<day3 order by (day3 - day1) desc,cte2.name asc;