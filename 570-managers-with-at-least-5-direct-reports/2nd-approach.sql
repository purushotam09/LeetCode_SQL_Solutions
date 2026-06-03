/* Write your T-SQL query statement below */
with cte as (
    select managerId, count(managerId) as cnt
    from Employee
    group by managerId
)
select name from Employee
where id in (select managerId from cte where cnt>=5 and managerId is not null)
