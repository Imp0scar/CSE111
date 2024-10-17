.headers on
SELECT COUNT(*) AS supplier_cnt
FROM (
    SELECT s.s_suppkey
    FROM supplier s
    JOIN partsupp ps ON s.s_suppkey = ps.ps_suppkey
    JOIN lineitem l ON ps.ps_partkey = l.l_partkey AND ps.ps_suppkey = l.l_suppkey
    JOIN orders o ON l.l_orderkey = o.o_orderkey
    JOIN customer c ON o.o_custkey = c.c_custkey
    JOIN nation n ON c.c_nationkey = n.n_nationkey
    WHERE n.n_name IN ('EGYPT', 'JORDAN')
    GROUP BY s.s_suppkey
    HAVING COUNT(DISTINCT o.o_orderkey) < 50
) AS subquery;
