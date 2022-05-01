

SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;
SET hive.exec.dynamic.partition.mode = nonstrict;

DROP TABLE IF EXISTS transform_aeroportos;
CREATE TABLE IF NOT EXISTS transform_aeroportos(

    iata_code STRING,
    aeroporto STRING,
    cidade STRING,
    latitude INT,
    longitude INT

    
)
stored as parquet
location "/user/hive/projeto/transform/aeroportos";

INSERT OVERWRITE TABLE transform_aeroportos
SELECT iata_code,airport,city,latitude,longitude FROM raw_bd_airports;


