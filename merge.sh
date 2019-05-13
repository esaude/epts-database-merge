#!/bin/bash
merge_db="merge_db"
mysql -uetl -pAdmin123 -e "drop database if exists $merge_db; create database $merge_db;"
first=1
for file in "dumps"/*
do
    database=$(basename "$file" ".sql")
    if [ $first -eq 1 ]
    then
        echo "Importing initial database into $merge_db from file $file"
        mysql -uetl -pAdmin123 $merge_db < $file
        mysql -uetl -pAdmin123 $merge_db < sql-scripts/merge.sql
        first=0
    else
        echo "Merging database $database from file $file"
        ./merge-single-database.sh $file $database > "output/$database.out" &
    fi
done