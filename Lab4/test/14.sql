.headers on
SELECT COUNT(*) AS items
FROM lineitem L
JOIN orders O ON L.l_orderkey = O.o_orderkey
JOIN customer C ON O.o_custkey = C.c_custkey
JOIN nation N ON C.c_nationkey = N.n_nationkey
JOIN region R ON N.n_regionkey = R.r_regionkey
JOIN supplier S ON L.l_suppkey = S.s_suppkey
JOIN nation SN ON S.s_nationkey = SN.n_nationkey
JOIN region SR ON SN.n_regionkey = SR.r_regionkey
WHERE R.r_name = 'ASIA' AND N.n_name = 'INDIA' AND SR.r_name = 'EUROPE';
