drop table if exists consumption_dia_semana_movimentado;

CREATE TABLE IF NOT EXISTS consumption_dia_semana_movimentado 
    row format delimited
    STORED AS parquet 
    location "/user/hive/projeto/consumption/dia_semana_movimentado"
AS select 
   case
   when dia_da_semana = '1' then "domingo"
   when dia_da_semana = '2' then "segunda"
   when dia_da_semana = '3' then "terca"
   when dia_da_semana = '4' then "quarta"
   when dia_da_semana = '5' then "quinta"
   when dia_da_semana = '6' then "sexta"
   when dia_da_semana = '7' then "sabado"
   else "null"
   end dia, count(*) as qtd_voos
   from transform_voos
   group by dia_da_semana
   order by qtd_voos desc