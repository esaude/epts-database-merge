# docker run --name merge-tool-mysql --rm -p 3309:3306 -e MYSQL_ROOT_PASSWORD=Admin123 -e MYSQL_ROOT_HOST=% merge-tool/mysql:latest
# docker build -t merge-tool/mysql mysql
FROM mysql/mysql-server:5.7
EXPOSE 3306
CMD ["mysqld"]
