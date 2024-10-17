.headers on
SELECT cr.r_name AS region
FROM region cr
JOIN nation cn ON cr.r_regionkey = cn.n_regionkey
JOIN customer c ON cn.n_nationkey = c.c_nationkey
JOIN orders o ON c.c_custkey = o.o_custkey
JOIN lineitem l ON o.o_orderkey = l.l_orderkey
JOIN supplier s ON l.l_suppkey = s.s_suppkey
JOIN nation sn ON s.s_nationkey = sn.n_nationkey
JOIN region sr ON sn.n_regionkey = sr.r_regionkey
WHERE cr.r_regionkey = sr.r_regionkey  -- Ensure customer and supplier are from the same region
GROUP BY cr.r_name
ORDER BY SUM(l.l_extendedprice) DESC
LIMIT 1;

