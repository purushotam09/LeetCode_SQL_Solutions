SELECT DISTINCT s1.id, s1.visit_date, s1.people
FROM Stadium s1
JOIN Stadium s2
    ON ABS(s1.id - s2.id) <= 2
WHERE s1.people >= 100
  AND s2.people >= 100
GROUP BY s1.id, s1.visit_date, s1.people
HAVING COUNT(*) >= 3
ORDER BY s1.visit_date;
