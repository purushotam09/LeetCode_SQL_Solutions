/* Write your T-SQL query statement below */
SELECT results
FROM (
    SELECT TOP 1 u.name AS results
    FROM MovieRating mr
    INNER JOIN Users u
        ON mr.user_id = u.user_id
    GROUP BY mr.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
) AS t1

UNION ALL

SELECT results
FROM (
    SELECT TOP 1 m.title AS results
    FROM MovieRating mr
    INNER JOIN Movies m
        ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01'
      AND mr.created_at < '2020-03-01'
    GROUP BY mr.movie_id, m.title
    ORDER BY AVG(mr.rating * 1.0) DESC, m.title ASC
) AS t2;