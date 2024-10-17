.headers on
SELECT COUNT(o_orderpriority) AS order_cnt
FROM Orders O
JOIN Customer C ON O.o_custkey = C.c_custkey
JOIN Nation N ON C.c_nationkey= N.n_nationkey
WHERE N.n_name = 'ROMANIA' 
AND O.o_orderpriority = '1-URGENT' 
AND O.o_orderdate BETWEEN '1993-01-01' AND '1997-12-31';
