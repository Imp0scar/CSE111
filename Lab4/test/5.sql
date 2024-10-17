.headers on
SELECT N.n_name AS country, COUNT(S.s_name) AS cnt
FROM Supplier S
JOIN Nation N ON S.s_nationkey = N.n_nationkey
WHERE N.n_name = 'JAPAN' OR N.n_name = 'CHINA'
GROUP BY N.n_name;
