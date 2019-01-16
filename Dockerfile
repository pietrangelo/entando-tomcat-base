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

##### DECOMMENT THIS IF YOU WANT TO ENABLE SSL##########################################
# ENV STOREPASS kabubiForPresident!123
# STOREPASS MUST BE DEFINED ALSO ON THE setenv.sh file
# ENV KEYPASS kabubiForPresident!123
# ENV CN=localhost

# RUN $JAVA_HOME/bin/keytool -genkeypair -alias tomcat -keyalg RSA -storepass ${STOREPASS} -keypass ${KEYPASS} -dname "CN=${CN},OU=,O=,L=,S=,C=IT"
# RUN sed -i 's/<Service name="Catalina">/<Service name="Catalina"> \n\n <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"\n maxThreads="150" SSLEnabled="true" scheme="https" secure="true"\n keystoreFile="\/root\/.keystore" keystorePass="kabubiForPresident!123"\n clientAuth="false" sslProtocol="TLS" \/>\n <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" \/> /' conf/server.xml
#########################################################################################
RUN apt-get update && apt-get install -y curl imagemagick nano software-properties-common wget && apt-get autoclean -y && apt-get autoremove -y


#Copy the DB drivers
COPY postgresql-42.1.4.jar /usr/local/tomcat/lib/postgresql-42.1.4.jar
COPY mysql-connector-java-5.1.42-bin.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.42-bin.jar
COPY ojdbc7.jar /usr/local/tomcat/lib/ojdbc7.jar
COPY setenv.sh /usr/local/tomcat/bin/setenv.sh

VOLUME [ "/usr/local/tomcat/webapps" ]

EXPOSE 8080

CMD [ "catalina.sh", "run" ]
