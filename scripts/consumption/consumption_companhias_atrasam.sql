drop table if exists comsumption_companhias_atrasam;

CREATE TABLE IF NOT EXISTS comsumption_companhias_atrasam 
    row format delimited 
    STORED AS parquet 
    location "/user/hive/projeto/consumption/companhias_atrasam"
AS select companhia_aerea ,
       avg(atraso_partida) as media_partida,
       avg(atraso_chegada ) as media_atraso_chegada
   from transform_voos
   group by companhia_aerea 
   order by media_partida desc, media_partida