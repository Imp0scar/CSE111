.headers on
SELECT S.s_name as supplier,  Count(P.p_size) as cnt
From Supplier S 
JOIN Nation N ON S.s_nationkey = N.n_nationkey
Join Partsupp Ps ON S.s_suppkey = Ps.ps_suppkey
JOIN Part P On Ps.ps_partkey = P.p_partkey
WHERE N.n_name = 'RUSSIA' 
AND P.p_container LIKE '%CAN%'
GROUP BY S.s_name;