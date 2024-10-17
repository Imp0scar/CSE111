.headers on
SELECT SUM(C.c_acctbal) AS tot_acct_bal
FROM Customer C 
JOIN Nation N ON N.n_nationkey = C.c_nationkey
JOIN Region R ON R.r_regionkey = N.n_regionkey
WHERE C.c_mktsegment = 'FURNITURE'
AND r_name = 'AMERICA'
