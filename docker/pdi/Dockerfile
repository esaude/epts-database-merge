#docker build --no-cache -t merge-tool/pdi pdi

FROM openjdk:8u131-jdk-alpine

RUN mkdir /root/.kettle
COPY etc/kettle.properties /root/.kettle
COPY etc/shared.xml /root/.kettle
COPY etc/start.sh /home
COPY etc/pdi-ce-8.2.0.0-342.zip /home

RUN apk --update add curl wget mysql-client bash && \
unzip /home/pdi-ce-8.2.0.0-342.zip && \
rm /home/pdi-ce-8.2.0.0-342.zip && \
curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.44.zip -o /home/mysql-driver.zip && \
unzip /home/mysql-driver.zip -d /home && \
cp /home/mysql-connector-java-5.1.44/mysql-connector-java-5.1.44-bin.jar /data-integration/lib && \
rm /home/mysql-driver.zip && \
rm -rf /home/mysql-connector-java-5.1.44 && \
curl -k -L https://github.com/edrisse/epts-database-merge/archive/master.zip -o /home/epts-database-merge.zip && \
unzip /home/epts-database-merge.zip && \
curl -k -L https://github.com/esaude/eptsreports-testing-scripts/archive/master.zip -o /home/eptsreports-testing-scripts.zip && \
unzip /home/eptsreports-testing-scripts.zip

CMD "/home/start.sh"
