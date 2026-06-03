/* Write your T-SQL query statement below */
with cte as(select t1.tiv_2016 from Insurance t1 where exists
(select 1 from Insurance t2 where t2.pid != t1.pid and 
t2.tiv_2015 = t1.tiv_2015 and t2.lat != t1.lat and t2.lon != t1.lon )
AND NOT EXISTS
(
    SELECT 1
    FROM Insurance t3
    WHERE t3.pid != t1.pid
      AND t3.lat = t1.lat
      AND t3.lon = t1.lon
)
) select round(sum(tiv_2016),2) as tiv_2016 from cte;