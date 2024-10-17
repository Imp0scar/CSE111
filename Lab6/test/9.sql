.headers on
SELECT COUNT(DISTINCT ps.ps_suppkey) AS supplier_cnt
FROM part p
JOIN partsupp ps ON p.p_partkey = ps.ps_partkey
WHERE p.p_retailprice = (
    SELECT MIN(p_retailprice)
    FROM part
);
