.headers on
SELECT SUM(O.o_totalprice) AS total_price
FROM Orders O
JOIN Customer C ON O.o_custkey = C.c_custkey
JOIN Nation N ON C.c_nationkey = N.n_nationkey
JOIN Region R ON N.n_regionkey = R.r_regionkey
-- WHERE N.n_name = 'UNITED STATES'
AND R.r_name = 'AMERICA' 
AND O.o_orderdate BETWEEN '1995-01-01' AND '1995-12-31';



-- .headers on
-- SELECT sum(orders.o_totalprice) AS total_price
-- FROM orders
-- JOIN
--     customer ON orders.o_custkey = customer.c_custkey,
--     nation ON customer.c_nationkey = nation.n_nationkey,
--     region ON nation.n_regionkey = region.r_regionkey
-- WHERE
--     strftime('%Y', orders.o_orderdate) = '1995' AND
--     region.r_name = 'AMERICA';