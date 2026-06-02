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

