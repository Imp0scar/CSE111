.headers on
Select C.c_name AS Customer, sum(O.o_totalprice) as total_price
From Customer C 
Join Nation N ON C.c_nationkey = N.n_nationkey
JOIN Orders O ON C.c_custkey = O.o_custkey
WHERE N.n_name = 'GERMANY'
AND O.o_orderdate Between '1992-01-01' AND '1992-12-31'
Group by C.c_name