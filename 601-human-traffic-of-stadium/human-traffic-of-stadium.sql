/* Write your T-SQL query statement below */
WITH cte AS (
    SELECT 
        id,
        visit_date,
        people,
        LEAD(id, 1) OVER(ORDER BY id) AS nID,
        LEAD(id, 2) OVER(ORDER BY id) AS nnID,
        LAG(id, 1) OVER(ORDER BY id) AS pID,
        LAG(id, 2) OVER(ORDER BY id) AS ppID
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM cte
WHERE 
       (nID = id + 1 AND nnID = id + 2)   -- starting row
    OR (pID = id - 1 AND ppID = id - 2)   -- ending row
    OR (pID = id - 1 AND nID = id + 1)    -- middle row
ORDER BY visit_date;
/*with cte as (
    select id,visit_date,people,
    lead(id,1,0) over(order by id asc) as nID , 
    lead(id,2,0) over(order by id asc) as nnID,
    lag(id,1,0) over(order by id asc) as pID,
    lag(id,2,0) over(order by id asc) as ppID from Stadium where people >= 100
)select t2.id , t2.visit_date ,t2.people from cte t2 where exists (
    select 1 from cte t1 where  t1.people = t2.people and t1.id = t2.id and ((t1.nID = t2.id + 1) and (t1.nnID = t2.id + 2)) or ((t1.pId = t2.id -1) and (t1.ppId = t2.id -2)) or ((t1.nID = t2.id + 1) and (t1.pId = t2.id -1))
)*/