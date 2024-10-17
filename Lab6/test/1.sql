.headers on
SELECT s.s_name AS supplier, 
       c.c_name AS customer, 
       o.o_totalprice AS price
FROM orders o
JOIN customer c ON o.o_custkey = c.c_custkey
JOIN lineitem l ON o.o_orderkey = l.l_orderkey
JOIN supplier s ON l.l_suppkey = s.s_suppkey
WHERE o.o_orderstatus = 'F'
AND o.o_totalprice = (
    SELECT MAX(o2.o_totalprice)
    FROM orders o2
    WHERE o2.o_orderstatus = 'F'
);
