.headers on
SELECT s_name, s_acctbal
FROM Supplier S
JOIN Nation N ON S.s_nationkey = N.n_nationkey
JOIN Region R ON N.n_regionkey = R.r_regionkey
WHERE R.r_name = 'ASIA' AND S.s_acctbal > 5000;
