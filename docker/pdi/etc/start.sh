echo "Creating database"
mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "create database merda;"
echo "Merge Tool PDI Container"
while true; do sleep 1000; done
