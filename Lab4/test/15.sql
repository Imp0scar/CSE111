.headers on
SELECT
    R.r_name AS region,
    S.s_name AS supplier,
    S.s_acctbal AS acct_bal
FROM
    supplier S
JOIN
    nation N ON S.s_nationkey = N.n_nationkey
JOIN
    region R ON N.n_regionkey = R.r_regionkey
WHERE
    S.s_acctbal = (
        SELECT MAX(S2.s_acctbal)
        FROM supplier S2
        JOIN nation N2 ON S2.s_nationkey = N2.n_nationkey
        WHERE N2.n_regionkey = R.r_regionkey
    )
ORDER BY
    R.r_name;
-- isnt outputting correctly