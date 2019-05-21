#!/bin/sh
file_name=$1
database=$2
user=$3
host=$4
pdi_dir=$5
scripts_dir=$MERGE_TOOL_SCRIPTS_DIR

if [ -z $scripts_dir ]
then
    scripts_dir="$HOME/eptsreports-testing-scripts"
fi

mysql -u$user -pAdmin123 -h$host -e "drop database if exists $database; create database $database;"
mysql -u$user -pAdmin123 -h$host $database < $file_name
$pdi_dir/data-integration/kitchen.sh -file=$scripts_dir/transformations/merge/merge-data.kjb $database
if [ $? -eq 0 ]
then
    echo "Merge effectuado com sucesso"
else
    echo "********Ocorreram erros na execução do Merge********"
fi
