echo "Creating database"

mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "select 1;"
until [ $? -eq 0 ]
do
  echo "Aguardado disponibilizacao da Base de Dados"
  sleep 10
  mysql -u$MERGE_TOOL_DB_USER -pAdmin123 -h$MERGE_TOOL_DB_HOST -e "select 1;"
done

cd /epts-database-merge-master/script
./merge.sh

sleep 10000
