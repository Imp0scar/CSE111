.headers on
SELECT strftime('%Y-%m', L.l_receiptdate) AS year_month,
       COUNT(*) AS items
FROM Lineitem L
JOIN Orders O ON L.l_orderkey = O.o_orderkey
JOIN Customer C ON O.o_custkey = C.c_custkey
WHERE C.c_name = 'Customer#000000227'
GROUP BY year_month
ORDER BY year_month ASC;
