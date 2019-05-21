#!/bin/bash
merge_db=$MERGE_TOOL_MERGE_DB
host=$MERGE_TOOL_DB_HOST
user=$MERGE_TOOL_DB_USER
dumps_directory=$MERGE_TOOL_DUMPS_DIR
output_directory=$MERGE_TOOL_OUTPUT_DIR
logs_directory=$MERGE_TOOL_LOGS_DIR
pdi_dir=$MERGE_TOOL_PDI_DIR

if [ -z $merge_db ]
then
    merge_db="merge_db"
fi

if [ -z $host ]
then
    host="localhost"
fi

if [ -z $user ]
then
    user="etl"
fi

if [ -z $dumps_directory ]
then
    dumps_directory="dumps"
fi

if [ -z $output_directory ]
then
    output_directory="output"
fi

if [ -z $logs_directory ]
then
    logs_directory="logs"
fi

if [ -z $pdi_dir ]
then
    pdi_dir="pdi"
fi

if [ ! -d $pdi_dir ]
then
    unzip pdi.zip -d $pdi_dir
    cp mysql-connector-java.jar $pdi_dir/data-integration/lib
fi

mysql -u$user -pAdmin123 -h$host -e "drop database if exists $merge_db; create database $merge_db;"
first=1
for file in "$dumps_directory"/*
do
    database=$(basename "$file" ".sql")
    if [ $first -eq 1 ]
    then
        echo "Importing initial database into $merge_db from file $file"
        mysql -u$user -pAdmin123 -h$host $merge_db < $file
        mysql -u$user -pAdmin123 -h$host $merge_db < sql-scripts/merge.sql
        first=0
    else
        echo "Merging database $database from file $file"
        ./merge-single-database.sh $file $database $user $host $pdi_dir > "$logs_directory/$database.out"
    fi
done

dump_file_name="$merge_db.sql"
echo "Dumping merge database $merge_db into $dump_file_name"
mysqldump -u$user -pAdmin123 -h$host $merge_db > "$output_directory/$dump_file_name"
