/* Write your T-SQL query statement below */
WITH cte AS
(
    SELECT
        t.status,
        t.request_at
    FROM Trips t
    INNER JOIN Users c
        ON t.client_id = c.users_id
    INNER JOIN Users d
        ON t.driver_id = d.users_id
    WHERE c.banned = 'No'
      AND d.banned = 'No'
      AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT
    request_at AS Day,
    ROUND(
        SUM(CASE 
                WHEN status IN ('cancelled_by_driver', 'cancelled_by_client')
                THEN 1 
                ELSE 0 
            END) * 1.0 / COUNT(*),
        2
    ) AS [Cancellation Rate]
FROM cte
GROUP BY request_at;