.headers on
SELECT sn.n_name AS country,
       SUM(CASE WHEN cn.n_nationkey != sn.n_nationkey THEN l.l_quantity ELSE 0 END) -
       SUM(CASE WHEN cn.n_nationkey = sn.n_nationkey THEN l.l_quantity ELSE 0 END) AS economic_exchange
FROM lineitem l
JOIN orders o ON l.l_orderkey = o.o_orderkey
JOIN customer c ON o.o_custkey = c.c_custkey
JOIN nation cn ON c.c_nationkey = cn.n_nationkey
JOIN supplier s ON l.l_suppkey = s.s_suppkey
JOIN nation sn ON s.s_nationkey = sn.n_nationkey
WHERE strftime('%Y', l.l_shipdate) = '1997'
GROUP BY sn.n_name
ORDER BY economic_exchange DESC;



