#!/bin/sh
FULL_FILE_NAME=$1
DATABASE_NAME=$2
mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "drop database if exists $DATABASE_NAME; create database $DATABASE_NAME;"
mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST $DATABASE_NAME < $FULL_FILE_NAME
/data-integration/kitchen.sh -file=/eptsreports-testing-scripts-master/transformations/merge/merge-data.kjb $DATABASE_NAME
if [ $? -eq 0 ]
then
    echo "Merge effectuado com sucesso"
else
    echo "********Ocorreram erros na execução do Merge********"
fi
