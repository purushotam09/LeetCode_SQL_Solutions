/* Write your T-SQL query statement below */
with cte as (select id,student,lead(id,1,0) over(order by id) as leadid from Seat) select case when id%2!=0 and leadid!=0 then id+1 when id%2!=0 and leadid=0 then id else id-1 end as id,student from cte order by id;

/*SELECT 
    CASE 
        WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        WHEN id % 2 = 1 THEN id + 1
        ELSE id - 1
    END AS id,
    student
FROM Seat
ORDER BY id;*/