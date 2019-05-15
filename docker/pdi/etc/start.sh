mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "select 1;"
until [ $? -eq 0 ]
do
  echo "Waiting for database to become available"
  sleep 10
  mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "select 1;"
done

cd /epts-database-merge-master/script
./merge.sh
