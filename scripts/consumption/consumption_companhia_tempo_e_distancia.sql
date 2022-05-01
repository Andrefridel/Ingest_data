drop table if exists consumptiom_companhia_tempo_e_distancia;

CREATE TABLE IF NOT EXISTS consumptiom_companhia_tempo_e_distancia 
    row format delimited 
    fields terminated by '|' 
    STORED AS parquet 
    location "/user/hive/projeto/consumption/tempo_voo_distancia"
AS select companhia_aerea,
       sum(tempo_ar) as tempo_voo_total,
       sum(distancia ) as distancia_voo_total
from transform_voos
group by companhia_aerea
order by tempo_voo_total desc, distancia_voo_total