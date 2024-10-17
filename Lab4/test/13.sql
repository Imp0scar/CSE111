.headers on
SELECT
    sup_region.r_name AS supp_region,
    cus_region.r_name AS cust_region,
    MIN(orders.o_totalprice) AS min_price
FROM
    orders
JOIN
    customer ON orders.o_custkey = customer.c_custkey
JOIN
    nation AS cus_nation ON customer.c_nationkey = cus_nation.n_nationkey
JOIN
    region AS cus_region ON cus_nation.n_regionkey = cus_region.r_regionkey
JOIN
    lineitem ON lineitem.l_orderkey = orders.o_orderkey
JOIN
    supplier ON supplier.s_suppkey = lineitem.l_suppkey
JOIN
    nation AS sup_nation ON supplier.s_nationkey = sup_nation.n_nationkey
JOIN
    region AS sup_region ON sup_nation.n_regionkey = sup_region.r_regionkey
WHERE
    sup_region.r_name != cus_region.r_name -- Exclude orders where supplier and customer are in the same region
GROUP BY
    sup_region.r_name, cus_region.r_name -- Group by supplier and customer regions
HAVING
    MIN(orders.o_totalprice) IS NOT NULL -- Ensure there is a valid total price
ORDER BY
    supp_region, cust_region;
-- isnt outputting correctly