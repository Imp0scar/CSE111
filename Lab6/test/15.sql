.headers on
SELECT sn.n_name AS country,
       SUM(CASE WHEN strftime('%Y', l.l_shipdate) = '1997' AND cn.n_nationkey != sn.n_nationkey THEN l.l_quantity ELSE 0 END) -
       SUM(CASE WHEN strftime('%Y', l.l_shipdate) = '1997' AND cn.n_nationkey = sn.n_nationkey THEN l.l_quantity ELSE 0 END) AS "1997",
       SUM(CASE WHEN strftime('%Y', l.l_shipdate) = '1998' AND cn.n_nationkey != sn.n_nationkey THEN l.l_quantity ELSE 0 END) -
       SUM(CASE WHEN strftime('%Y', l.l_shipdate) = '1998' AND cn.n_nationkey = sn.n_nationkey THEN l.l_quantity ELSE 0 END) AS "1998"
FROM lineitem l
JOIN orders o ON l.l_orderkey = o.o_orderkey
JOIN customer c ON o.o_custkey = c.c_custkey
JOIN nation cn ON c.c_nationkey = cn.n_nationkey
JOIN supplier s ON l.l_suppkey = s.s_suppkey
JOIN nation sn ON s.s_nationkey = sn.n_nationkey
WHERE strftime('%Y', l.l_shipdate) IN ('1997', '1998')
GROUP BY sn.n_name
ORDER BY sn.n_name;

