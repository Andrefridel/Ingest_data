--arquivo airlines.csv


drop table if exists raw_bd_airlines;
create external table if not exists raw_bd_airlines (
    airport_code STRING,
    airport_name STRING,
    time_label STRING,
    time_month STRING,
    time_month_name STRING,
    time_year STRING,
    statistics_of_delays_carrier STRING,
    statistics_of_delays_late_aircraft STRING,
    statistics_of_delays_national_aviation_system STRING,
    statistics_of_delays_security STRING,
    statistics_of_delays_weather STRING,
    statistics_carriers_names STRING,
    statistics_carriers_total STRING,
    statistics_flights_cancelled STRING,
    statistics_flights_delayed STRING,
    statistics_flights_diverted STRING,
    statistics_flights_on_time STRING,
    statistics_flights_total STRING,
    statistics_minutes_delayed_carrier STRING,
    statistics_minutes_delayed_late_aircraft STRING,
    statistics_minutes_delayed_national_aviation_system STRING,
    statistics_minutes_delayed_security STRING,
    statistics_minutes_delayed_total STRING,
    statistics_minutes_delayed_weather STRING

)
row format delimited 
fields TERMINATED by ','
lines terminated by '\n'
stored as textfile
LOCATION '/user/hive/projeto/raw/airlines'
tblproperties ('skip.header.line.count'='1');


