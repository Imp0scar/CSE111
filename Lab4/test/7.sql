.headers on
SELECT N.n_name AS country, O.o_orderstatus AS status, COUNT(O.o_orderkey) AS orders
FROM Customer C
JOIN Nation N ON C.c_nationkey = N.n_nationkey
JOIN Region R ON N.n_regionkey = R.r_regionkey
JOIN Orders O ON C.c_custkey = O.o_custkey
WHERE R.r_name = 'ASIA'
GROUP BY N.n_name, O.o_orderstatus
ORDER BY N.n_name, O.o_orderstatus;
