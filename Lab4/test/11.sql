.headers on
SELECT
    COUNT(DISTINCT O.o_orderkey) AS order_cnt
FROM
    orders O
JOIN
    customer C ON O.o_custkey = C.c_custkey
JOIN
    lineitem L ON O.o_orderkey = L.l_orderkey
JOIN
    supplier S ON L.l_suppkey = S.s_suppkey
WHERE
    C.c_acctbal < 0   -- Customers with negative account balance
    AND S.s_acctbal > 0  -- Suppliers with positive account balance;
