-- criacao de particionamento dinamico  


set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;




DROP TABLE IF EXISTS transform_voos;
CREATE EXTERNAL TABLE IF NOT EXISTS transform_voos(
    dia STRING,
    dia_da_semana STRING,
    companhia_aerea STRING,
    numero_voo STRING,
    numero_cauda STRING,
    aeroporto_origem STRING,
    aeroporto_destino STRING,
    partida_agendada STRING,
    tempo_partida STRING,
    atraso_partida STRING,
    taxi_fora STRING,
    levantamento_voo STRING,
    tempo_programado STRING,
    tempo_decorrido STRING,
    tempo_ar string,
    distancia STRING,
    taxi_dentro STRING,
    chegada_programada STRING,
    tempo_chegada STRING,
    atraso_chegada STRING,
    desvio STRING,
    cancelada STRING,
    motivo_de_cancelamento STRING,
    atraso_sistema_ar STRING,
    atraso_de_seguranca STRING,
    atraso_da_companhia_aerea STRING,
    atraso_de_aeronave STRING,
    atraso_de_tempo STRING
    
)

PARTITIONED BY (ANO STRING, MES STRING)
STORED AS PARQUET
LOCATION "/user/hive/projeto/transform/voos";

INSERT OVERWRITE TABLE transform_voos PARTITION(ANO,MES)
SELECT 
    day, 
    day_of_week,
    airline, 
    flight_number,
    tail_number,
    origin_airport,
    destination_airport,
    scheduled_departure,
    departure_time,
    departure_delay,
    taxi_out, 
    wheels_off, 
    scheduled_time,
    elapsed_time,
    air_time,
    distance,
    taxi_in,
    scheduled_arrival,
    arrival_time,
    arrival_delay,
    diverted,
    cancelled,
    cancellation_reason,
    air_system_delay,
    security_delay,
    airline_delay,
    late_aircraft_delay,
    weather_delay,
    year , 
    month  



    from raw_bd_flights;