FROM tomcat:8

LABEL maintainer="Pietrangelo Masala <p.masala@entando.com>"
LABEL description="Base image supporting entando deployment on tomcat container. Supported DBs: MySql, PostgreSQL, Oracle"

##### DEFAULT VALUES###################################################################
# ENV CATALINA_BASE=/usr/local/tomcat
# ENV CATALINA_HOME=/usr/local/tomcat
# ENV CATALINA_TMPDIR=/usr/local/tomcat/temp
# ENV JRE_HOME=/usr
# ENV CLASSPATH=/usr/local/tomcat/bin/bootstrap.jar:/usr/local/tomcat/bin/tomcat-juli.jar
########################################################################################

RUN apt update && apt install -y imagemagick nano && apt autoclean -y && apt autoremove -y

ENV JPAGENT_PATH="-agentpath:/opt/jprofiler10/bin/linux-x64/libjprofilerti.so=port=8849"

#Copy the DB drivers
COPY postgresql-42.1.4.jar /usr/local/tomcat/lib/postgresql-42.1.4.jar
COPY mysql-connector-java-5.1.42-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.42-bin.jar
COPY ojdbc7.jar /usr/local/tomcat/lib/ojdbc7.jar

#Jprofile agent
COPY jprofiler10/ /opt/jprofiler10/

VOLUME [ "/usr/local/tomcat/webapps" ]

EXPOSE 8080 8009 8849
CMD [ "catalina.sh", "run", "-agentpath:/opt/jprofiler10/bin/linux-64/libjprofilerti.so=port=8849" ]
