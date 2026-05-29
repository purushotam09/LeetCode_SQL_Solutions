/* Write your T-SQL query statement below */
with cte as (
    select departmentId, name, salary , dense_rank() over(partition by departmentId order by salary desc) as rnk from Employee
)
select d.name as Department , e.name as Employee , e.salary as Salary
from Department d inner join cte e on d.id = e.departmentId where e.rnk <= 3;