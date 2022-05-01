#!/bin/bash



echo "creating directory for consumption"
hdfs dfs -mkdir -p /user/hive/projeto/consumption/
hdfs dfs -mkdir -p /user/hive/projeto/consumption/aeroportos_movimentados
hdfs dfs -mkdir -p /user/hive/projeto/consumption/companhias_mais_voam
hdfs dfs -mkdir -p /user/hive/projeto/consumption/motivos_cancelamentos
hdfs dfs -mkdir -p /user/hive/projeto/consumption/companhias_atrasam
hdfs dfs -mkdir -p /user/hive/projeto/consumption/companhias_atrasam_faixa
hdfs dfs -mkdir -p /user/hive/projeto/consumption/dia_semana_movimentado
hdfs dfs -mkdir -p /user/hive/projeto/consumption/tempo_voo_distancia



echo "create table aeroportos_movimentados"
hive -f /media/host/Flight/consumption/scripts/consumption_aeroportos_movimentados.sql

echo "create table companhias_mais_voam"
hive -f /media/host/Flight/consumption/scripts/consumption_companhia_voos.sql

echo "create table motivos_cancelamentos"
hive -f /media/host/Flight/consumption/scripts/consumption_motivos_cancel.sql

echo "create table companhias_atrasam"
hive -f /media/host/Flight/consumption/scripts/consumption_companhias_atrasam.sql

echo "create table companhias_atrasam_faixa"
hive -f /media/host/Flight/consumption/scripts/consumption_faixa_atraso.sql

echo "create table dia_semana_movimentado"
hive -f /media/host/Flight/consumption/scripts/consumption_dia_semana_movimentado.sql

echo "create table tempo_voo_distancia"
hive -f /media/host/Flight/consumption/scripts/consumption_companhia_tempo_e_distancia.sql




