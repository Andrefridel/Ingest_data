#!/bin/bash

echo "Criação da estrutura de diretórios e camada Raw"
bash ambiente_raw.sh

echo "Rodando script da camada transform"
bash transform.sh

echo "Rodando script da camada consumption"
bash consumption.sh