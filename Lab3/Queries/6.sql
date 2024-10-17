.headers on
SELECT N.n_name AS n_name, SUM(S.s_acctbal) AS total_acct_bal
FROM Supplier S
JOIN Nation N ON S.s_nationkey = N.n_nationkey
GROUP BY N.n_name;
