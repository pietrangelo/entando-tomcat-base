FROM tomcat:8

LABEL maintainer="Pietrangelo Masala <p.masala@entando.com>"
LABEL description="Base image supporting  deployment on tomcat container. Supported DBs: MySql, PostgreSQL, Oracle"

##### DEFAULT VALUES###################################################################
# ENV CATALINA_BASE=/usr/local/tomcat
# ENV CATALINA_HOME=/usr/local/tomcat
# ENV CATALINA_TMPDIR=/usr/local/tomcat/temp
# ENV JRE_HOME=/usr
# ENV CLASSPATH=/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar
########################################################################################

RUN apt update && apt install -y imagemagick nano && apt autoclean -y && apt autoremove -y

#Copy the DB drivers
COPY postgresql-42.1.4.jar /usr/local/tomcat/lib/postgresql-42.1.4.jar
COPY mysql-connector-java-5.1.42-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.42-bin.jar
COPY ojdbc7.jar /usr/local/tomcat/lib/ojdbc7.jar


VOLUME [ "/usr/local/tomcat/webapps" ]

EXPOSE 8080
CMD [ "catalina.sh", "run" ]
