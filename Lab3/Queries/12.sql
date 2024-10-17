.headers on

SELECT SUBSTR(O.o_orderdate, 1, 4) AS year, 
       COUNT(*) AS item_cnt
FROM Lineitem L
JOIN Orders O ON L.l_orderkey = O.o_orderkey
JOIN Supplier S ON L.l_suppkey = S.s_suppkey
JOIN Nation N ON S.s_nationkey = N.n_nationkey
WHERE O.o_orderpriority = '3-MEDIUM'
AND (N.n_name = 'ARGENTINA' OR N.n_name = 'BRAZIL')
GROUP BY year
ORDER BY year ASC;
