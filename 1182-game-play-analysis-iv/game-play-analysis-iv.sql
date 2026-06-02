/* Write your T-SQL query statement below */
    WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
    1.0 * COUNT(a.player_id) / COUNT(f.player_id),
    2
) AS fraction
FROM first_login f
LEFT JOIN Activity a
ON f.player_id = a.player_id
AND a.event_date = DATEADD(day, 1, f.first_login_date);

/*
select player_id, min(event_date) as first_login
into #temp
from Activity
group by player_id;

declare @var1 INT, @var2 INT;

select @var1 = count(*) from #temp;

select @var2 = count(*)
from Activity a
inner join #temp t
on a.player_id = t.player_id
and a.event_date = dateadd(day, 1, t.first_login);

select round(1.0 * @var2 / @var1, 2) as fraction;*/