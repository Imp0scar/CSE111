.headers on
SELECT
    P.p_type AS part_type,
    MIN(L.l_discount) AS min_disc,
    MAX(L.l_discount) AS max_disc
FROM
    part P
JOIN
    lineitem L ON P.p_partkey = L.l_partkey
WHERE
    P.p_type LIKE '%MEDIUM%' OR P.p_type LIKE '%TIN%'  -- Filter for part types with "MEDIUM" or "TIN"
GROUP BY
    P.p_type                                          -- Group by part type
ORDER BY
    P.p_type;                                         -- Order by part type for readability
