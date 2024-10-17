.headers on
SELECT COUNT(DISTINCT O.o_clerk) AS clerks
FROM Supplier S
JOIN Nation N ON S.s_nationkey = N.n_nationkey
JOIN Partsupp Ps ON S.s_suppkey = Ps.ps_suppkey
JOIN Lineitem L ON Ps.ps_partkey = L.l_partkey AND S.s_suppkey = L.l_suppkey
JOIN Orders O ON L.l_orderkey = O.o_orderkey
WHERE N.n_name = 'IRAQ';
