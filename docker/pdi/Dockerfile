# docker run --name merge-tool-pdi --rm merge-tool/pdi:latest
# docker build -t merge-tool/pdi pdi
FROM openjdk:8u131-jdk-alpine
RUN apk --update add curl wget mysql-client

#RUN mkdir /root/.kettle
#COPY etc/kettle.properties /root/.kettle
#COPY etc/shared.xml /root/.kettle
#COPY etc/pdi-ce-8.2.0.0-342.zip /home
#RUN unzip /home/pdi-ce-8.2.0.0-342.zip
#RUN curl -k -L https://github.com/jwilder/dockerize/releases/download/v0.2.0/dockerize-linux-amd64-v0.2.0.tar.gz -o /home/dockerize-linux-amd64-v0.2.0.tar.gz
#CMD "/home/data-integration/kitchen.sh -file /home/emr-to-mozart-etl-master/migrate-data.kjb"

COPY script /home

COPY etc/start.sh /home
CMD "/home/start.sh"


#PDI download link
#https://downloads.sourceforge.net/project/pentaho/Pentaho%208.2/client-tools/pdi-ce-8.2.0.0-342.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentaho%2Ffiles%2Flatest%2Fdownload%3FaliId%3DeyJpIjoiTkNlM05LMnVIaGNOV2swbCIsInQiOiIzeFdiTXowcnJOYXlNeWVidnh5OWVnPT0ifQ%25253D%25253D&ts=1557747089
