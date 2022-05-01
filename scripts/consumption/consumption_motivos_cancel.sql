drop table if exists consuptiom_motivos_cancelamento;

CREATE TABLE IF NOT EXISTS consuptiom_motivos_cancelamento 
    row format delimited 
    STORED AS parquet 
    location "/user/hive/projeto/consumption/motivos_cancelamentos"
AS select 
   case 
     when motivo_de_cancelamento = "A" then "Airline/Carrier"
     when motivo_de_cancelamento = "B" then "Weather"
     when motivo_de_cancelamento = "C" then "National Air System"
     when motivo_de_cancelamento = "D" then "Security"
   end as motivo_de_cancelamento, count(*) as quantidade
   from transform_voos
   where motivo_de_cancelamento not like ""
   group by motivo_de_cancelamento;




