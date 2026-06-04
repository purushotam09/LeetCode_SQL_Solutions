/* Write your T-SQL query statement below */
with cte as (
    select id,visit_date,people,lead(id,1,0) over(order by id asc) as nID , lead(id,2,0) over(order by id asc) as nnID,lag(id,1,0) over(order by id asc) as pID,lag(id,2,0) over(order by id asc) as ppID from Stadium where people >= 100
)select t2.id , t2.visit_date ,t2.people from cte t2 where exists (
    select 1 from cte t1 where  t1.people = t2.people and t1.id = t2.id and ((t1.nID = t2.id + 1) and (t1.nnID = t2.id + 2)) or ((t1.pId = t2.id -1) and (t1.ppId = t2.id -2)) or ((t1.nID = t2.id + 1) and (t1.pId = t2.id -1))
)