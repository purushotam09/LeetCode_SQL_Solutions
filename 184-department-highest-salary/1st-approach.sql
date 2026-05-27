/* Write your T-SQL query statement below */
select d.name as Department,e.name as Employee, e.salary as Salary 
from Employee e inner join 
(select departmentId , max(salary) as Maxsalary from Employee group by departmentID) as t
on e.departmentId = t.departmentId and e.salary = t.Maxsalary
inner join 
Department d on e.departmentId = d.id
