.headers on
SELECT COUNT(*) AS part_cnt
FROM (
    SELECT ps.ps_partkey
    FROM partsupp ps
    JOIN supplier s ON ps.ps_suppkey = s.s_suppkey
    JOIN nation n ON s.s_nationkey = n.n_nationkey
    WHERE n.n_name = 'UNITED STATES'
    GROUP BY ps.ps_partkey
    HAVING COUNT(DISTINCT ps.ps_suppkey) = 1
) AS subquery;
