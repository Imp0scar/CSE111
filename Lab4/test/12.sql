.headers on
SELECT R.r_name AS region, MAX(S.s_acctbal) AS max_bal
FROM Supplier S
JOIN Nation N ON S.s_nationkey = N.n_nationkey
JOIN Region R ON N.n_regionkey = R.r_regionkey
GROUP BY R.r_name
HAVING MAX(S.s_acctbal) > 9000;  -- Only include regions where max balance > 9000
