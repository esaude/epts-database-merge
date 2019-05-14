echo "Creating database"

mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "select 1;"
echo $?
until [ $? -eq 0 ]
do
  sleep 1
  mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "select 1;"
done

echo "Merge Tool PDI Container"
while true; do sleep 1000; done
