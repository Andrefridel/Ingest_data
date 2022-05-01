


-- arquivo airports.csv


drop table if exists raw_bd_airports;
create external table if not exists raw_bd_airports(
    iata_code STRING,
    airport STRING,
    city STRING,
    state STRING,
    country STRING,
    latitude STRING,
    longitude STRING
)
row format delimited 
fields TERMINATED by ','
lines terminated by '\n'
stored as textfile
LOCATION "/user/hive/projeto/raw/airports"
tblproperties ('skip.header.line.count'='1');

