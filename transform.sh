#!/bin/bash



echo "creating directory for transformation"
hdfs dfs -mkdir -p /user/hive/projeto/transform/
hdfs dfs -mkdir -p /user/hive/projeto/transform/voos
hdfs dfs -mkdir -p /user/hive/projeto/transform/aeroportos


echo "create table transform_voos"
hive -f /media/host/Flight/transform/scripts/transform_voos.sql

echo "create table transform_aeroportos"
hive -f /media/host/Flight/transform/scripts/transform_aeroportos.sql



