drop table if exists consumption_aeroportos_movimentados;

CREATE TABLE IF NOT EXISTS consumption_aeroportos_movimentados
    row format delimited
    STORED AS parquet 
    location "/user/hive/projeto/consumption/aeroportos_movimentados"
    As select  v.aeroporto_destino,a.iata_code,
    count(*) as total_voos
    from transform_voos as v
    join transform_aeroportos as a on v.aeroporto_destino = a.iata_code
    group by v.aeroporto_destino ,a.iata_code
    order by total_voos desc 