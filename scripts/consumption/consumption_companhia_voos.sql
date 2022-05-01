drop table if exists consumption_companhias_mais_voam;

CREATE TABLE IF NOT EXISTS consumption_companhias_mais_voam 
    row format delimited 
    fields terminated by '|' 
    STORED AS parquet 
    location "/user/hive/projeto/consumption/companhias_mais_voam"
AS select companhia_aerea, count(*) as quantidade_voos
   from transform_voos
   group by companhia_aerea
   order by  quantidade_voos desc
