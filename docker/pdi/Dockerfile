# docker run --name merge-tool-pdi --rm merge-tool/pdi:latest
# docker build --no-cache -t merge-tool/pdi pdi
FROM openjdk:8u131-jdk-alpine
RUN apk --update add curl wget mysql-client bash

#RUN mkdir /root/.kettle
#COPY etc/kettle.properties /root/.kettle
#COPY etc/shared.xml /root/.kettle
#COPY etc/pdi-ce-8.2.0.0-342.zip /home
#RUN unzip /home/pdi-ce-8.2.0.0-342.zip

RUN curl -k -L https://github.com/edrisse/epts-database-merge/archive/master.zip -o /home/master.zip
RUN unzip /home/master.zip

COPY etc/start.sh /home
CMD "/home/start.sh"


#PDI download link
#https://downloads.sourceforge.net/project/pentaho/Pentaho%208.2/client-tools/pdi-ce-8.2.0.0-342.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fpentaho%2Ffiles%2Flatest%2Fdownload%3FaliId%3DeyJpIjoiTkNlM05LMnVIaGNOV2swbCIsInQiOiIzeFdiTXowcnJOYXlNeWVidnh5OWVnPT0ifQ%25253D%25253D&ts=1557747089
