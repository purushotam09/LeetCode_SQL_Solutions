/* Write your T-SQL query statement below */
with cte as (
    select managerId , count(*) as NoOfReports 
    from Employee group by managerId having count(*) >= 5
) select e.name as name from Employee e inner join cte c on
e.id = c.managerId;