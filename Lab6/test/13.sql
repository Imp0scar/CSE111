.headers on
SELECT n.n_name AS country
FROM nation n
JOIN customer c ON n.n_nationkey = c.c_nationkey
GROUP BY n.n_name
ORDER BY COUNT(c.c_custkey) DESC
LIMIT 1;
