.headers on
SELECT N.n_name AS country, COUNT(O.o_orderkey) AS cnt
FROM Nation N
JOIN Customer C ON N.n_nationkey = C.c_nationkey
JOIN Orders O ON C.c_custkey = O.o_custkey
JOIN Region R ON N.n_regionkey = R.r_regionkey
WHERE R.r_name = 'MIDDLE EAST'
GROUP BY N.n_name;
