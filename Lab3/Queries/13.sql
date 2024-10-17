.headers on
SELECT s_name, COUNT(*) as discounted_items
FROM Lineitem L
JOIN Supplier S ON L.l_suppkey = S.s_suppkey
WHERE L.l_discount = .1
GROUP BY S.s_name;