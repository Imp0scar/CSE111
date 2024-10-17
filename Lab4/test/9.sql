.headers on
SELECT
    nation.n_name AS country,
    COUNT(DISTINCT orders.o_orderkey) AS cnt
FROM
    orders
JOIN
    lineitem L ON orders.o_orderkey = L.l_orderkey
JOIN
    supplier ON supplier.s_suppkey = L.l_suppkey
JOIN
    nation ON nation.n_nationkey = supplier.s_nationkey
JOIN
    region ON nation.n_regionkey = region.r_regionkey
WHERE
    L.l_receiptdate BETWEEN '1994-01-01' AND '1994-12-31'  -- Receipt date in 1994
    AND region.r_name = 'AMERICA'                          -- Region is "AMERICA"
    AND orders.o_orderstatus = 'F'                         -- Completed orders (status 'F')
GROUP BY
    nation.n_name                                          -- Group by nation name
HAVING
    COUNT(DISTINCT orders.o_orderkey) >= 250               -- Only include nations with >= 250 orders
ORDER BY
    cnt DESC;                                              -- Order by count in descending order
-- isnt outputting correctly