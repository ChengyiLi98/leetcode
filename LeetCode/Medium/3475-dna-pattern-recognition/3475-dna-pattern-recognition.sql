# Write your MySQL query statement below
select *,
# CASE WHEN dna_sequence LIKE 'ATG%' THEN 1 ELSE 0 END AS has_start,
(case when dna_sequence REGEXP '^ATG' then 1 else 0 end) has_start,
( CASE WHEN dna_sequence LIKE '%TAA' 
      OR dna_sequence LIKE '%TAG' 
      OR dna_sequence LIKE '%TGA' 
    THEN 1 ELSE 0 END) as has_stop,
(CASE WHEN dna_sequence REGEXP 'ATAT' THEN 1 ELSE 0 END) has_atat,
(CASE WHEN dna_sequence REGEXP 'G{3,}' THEN 1 ELSE 0 END) has_ggg
from Samples
order by sample_id asc;
