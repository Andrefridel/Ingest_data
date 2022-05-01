drop table if exists consumption_faixa_atraso;

CREATE TABLE IF NOT EXISTS consumption_faixa_atraso 
row format delimited 
STORED AS parquet 
location "/user/hive/projeto/consumption/companhias_atrasam_faixa"
as 
select  s.companhia_aerea companhia_id,
        s.faixa faixa,
        count(*) atraso
from 
   (select companhia_aerea,
            case
            when atraso_chegada + atraso_partida between 0 and 30 then '0-30'
            when atraso_chegada + atraso_partida between 31 and 60 then '31-60'
            when atraso_chegada + atraso_partida between 61 and 90 then '61-90'
            when atraso_chegada + atraso_partida > 90 then '90-'
            else 'N/A'
            end as faixa
    from transform_voos) as s
group by s.companhia_aerea,faixa
order by faixa asc, atraso desc




