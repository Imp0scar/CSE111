.headers on
SELECT DISTINCT p.p_name AS part
FROM part p
JOIN lineitem l ON p.p_partkey = l.l_partkey
JOIN orders o ON l.l_orderkey = o.o_orderkey
JOIN customer c ON o.o_custkey = c.c_custkey
JOIN nation cn ON c.c_nationkey = cn.n_nationkey
JOIN region cr ON cn.n_regionkey = cr.r_regionkey
JOIN partsupp ps ON p.p_partkey = ps.ps_partkey
JOIN supplier s ON ps.ps_suppkey = s.s_suppkey
JOIN nation sn ON s.s_nationkey = sn.n_nationkey
JOIN region sr ON sn.n_regionkey = sr.r_regionkey
WHERE cr.r_name = 'ASIA' 
  AND sr.r_name = 'AFRICA'
GROUP BY p.p_name
HAVING COUNT(DISTINCT s.s_suppkey) = 3
   AND COUNT(DISTINCT sr.r_name) = 1
ORDER BY p.p_name ASC;