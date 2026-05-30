/* Write your T-SQL query statement below */
with cte as(select id,num, lag(num,1) over(order by id asc) as prev1, lag(num,2) over(order by id asc) as prev2
from Logs )
select distinct num as ConsecutiveNums from cte where prev1 = num and prev2 = num ;