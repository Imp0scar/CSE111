.headers on
Select C.c_name as customer, Count(O.o_orderkey) AS cnt
From Nation N
JOIN Customer C ON N.n_nationkey = C.c_nationkey
JOIN Orders O ON C.c_custkey = O.o_custkey
Where N.n_name = 'MOZAMBIQUE'
And O.o_orderdate Between '1997-01-01' AND '1997-12-31'
GROUP BY C.c_name;
