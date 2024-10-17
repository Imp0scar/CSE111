.headers on
SELECT S.s_name AS supplier, O.o_orderpriority AS priority, COUNT(DISTINCT Ps.ps_partkey) AS parts
FROM Supplier S
JOIN Nation N ON S.s_nationkey = N.n_nationkey
JOIN Partsupp Ps ON S.s_suppkey = Ps.ps_suppkey
JOIN Lineitem L ON Ps.ps_partkey = L.l_partkey AND S.s_suppkey = L.l_suppkey
JOIN Orders O ON L.l_orderkey = O.o_orderkey
WHERE N.n_name = 'ARGENTINA'
GROUP BY S.s_name, O.o_orderpriority
ORDER BY S.s_name, O.o_orderpriority;

