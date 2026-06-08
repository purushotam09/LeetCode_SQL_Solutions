/*select (select top 1 salary from Employee where salary < (select max(salary) from Employee) order by salary desc) as SecondHighestSalary */

select (select distinct salary from Employee order by salary desc offset 1 rows fetch next 1 rows only) as SecondHighestSalary;