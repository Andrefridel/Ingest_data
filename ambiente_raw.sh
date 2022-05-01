#!/bin/bash


echo "remove as masses or directories"
hdfs dfs -rm -r /user/hive/projeto/raw
hdfs dfs -rm -r /user/hive/projeto/transform
hdfs dfs -rm -r /user/hive/projeto/consumption

echo "creation of directories raw"
hdfs dfs -mkdir -p /user/hive/projeto/raw/airlines
hdfs dfs -mkdir -p /user/hive/projeto/raw/airports
hdfs dfs -mkdir -p /user/hive/projeto/raw/flights

echo "copying files from local environment to hadoop system"
hdfs dfs -put -f /media/host/Flight/raw/airports/airports.csv /user/hive/projeto/raw/airports
hdfs dfs -put -f /media/host/Flight/raw/airlines/airlines.csv /user/hive/projeto/raw/airlines
hdfs dfs -put -f /media/host/Flight/raw/flights/flights.csv /user/hive/projeto/raw/flights

echo "running scripts"
hive -f /media/host/Flight/raw/scripts/raw/raw_bd_airlines.sql
hive -f /media/host/Flight/raw/scripts/raw/raw_bd_airports.sql
hive -f /media/host/Flight/raw/scripts/raw/raw_bd_flights.sql












