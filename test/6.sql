.headers on
SELECT COUNT(DISTINCT s.supplier_id) AS suppliers_cnt
FROM Suppliers s
JOIN Supplies p ON s.supplier_id = p.supplier_id
WHERE s.country = 'Peru'
GROUP BY s.supplier_id
HAVING COUNT(DISTINCT p.part_id) > 40;
