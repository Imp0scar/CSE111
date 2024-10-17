.headers on
SELECT COUNT(*) AS customer_cnt
FROM (
    SELECT o.o_custkey
    FROM orders o
    WHERE strftime('%Y-%m', o.o_orderdate) = '1995-11'
    GROUP BY o.o_custkey
    HAVING COUNT(o.o_orderkey) <= 3
) AS subquery;
