.headers on
SELECT r_name, COUNT(*) AS order_cnt
FROM Orders O 
JOIN Customer C ON O.o_custkey = C.c_custkey
JOIN Nation N ON C.c_nationkey = N.n_nationkey
JOIN Region R ON N.n_regionkey = R.r_regionkey
WHERE O.o_orderstatus = 'F'
GROUP BY r_name;

