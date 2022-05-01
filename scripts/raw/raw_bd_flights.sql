-- arquivo flights.csv


drop table if exists raw_bd_flights;
create external table if not exists raw_bd_flights(
    year STRING,
    month STRING,
    day STRING,
    day_of_week STRING,
    airline STRING,
    flight_number STRING,
    tail_number STRING,
    origin_airport STRING,
    destination_airport STRING,
    scheduled_departure STRING,
    departure_time STRING,
    departure_delay STRING,
    taxi_out STRING,
    wheels_off STRING,
    scheduled_time STRING,
    elapsed_time STRING,
    air_time STRING,
    distance STRING,
    wheels_on STRING,
    taxi_in STRING,
    scheduled_arrival STRING,
    arrival_time STRING,
    arrival_delay STRING,
    diverted STRING,
    cancelled STRING,
    cancellation_reason STRING,
    air_system_delay STRING,
    security_delay STRING,
    airline_delay STRING,
    late_aircraft_delay STRING,
    weather_delay STRING
)
row format delimited fields TERMINATED by ','
lines terminated by '\n'
stored as textfile
LOCATION '/user/hive/projeto/raw/flights'
tblproperties ('skip.header.line.count'='1');


