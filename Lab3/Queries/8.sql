.headers on
SELECT N.n_name AS n_name
FROM Orders O
JOIN Customer C ON O.o_custkey = C.c_custkey
JOIN Nation N ON C.c_nationkey = N.n_nationkey
WHERE O.o_orderdate BETWEEN '1994-12-01' AND '1994-12-31'
GROUP BY N.n_name
ORDER BY N.n_name ASC;