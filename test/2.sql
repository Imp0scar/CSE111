.headers on
SELECT COUNT(DISTINCT o.o_custkey) AS customer_cnt
FROM orders o
JOIN lineitem l ON o.o_orderkey = l.l_orderkey
JOIN supplier s ON l.l_suppkey = s.s_suppkey
JOIN nation n ON s.s_nationkey = n.n_nationkey
JOIN region r ON n.n_regionkey = r.r_regionkey
WHERE r.r_name = 'AFRICA'
AND NOT EXISTS (
    SELECT 1
    FROM lineitem l2
    JOIN supplier s2 ON l2.l_suppkey = s2.s_suppkey
    JOIN nation n2 ON s2.s_nationkey = n2.n_nationkey
    JOIN region r2 ON n2.n_regionkey = r2.r_regionkey
    WHERE l2.l_orderkey = o.o_orderkey
    AND r2.r_name != 'AFRICA'
);

