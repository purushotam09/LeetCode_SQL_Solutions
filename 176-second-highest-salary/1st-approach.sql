select (select top 1 salary from Employee where salary < 
  (select max(salary) from Employee) order by salary desc) as SecondHighestSalary
