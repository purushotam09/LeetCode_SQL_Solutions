/* Write your T-SQL query statement below */
update Salary set sex = case when sex = 'f' then 'm' else 'f' end;