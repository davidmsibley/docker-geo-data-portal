FROM tomcat:7 

MAINTAINER Jordan Walker <jiwalker@usgs.gov>

ENV GDP_VERSION 36

RUN apt-get update && \
	apt-get install -y gettext 

RUN rm -rf ${CATALINA_HOME}/webapps/*
ADD http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/gdp/gdp-process-wps/${GDP_VERSION}/gdp-process-wps-${GDP_VERSION}.war ${CATALINA_HOME}/webapps/gdp-process-wps.war
ADD https://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc41.jar ${CATALINA_HOME}/lib/

COPY conf/ ${CATALINA_HOME/conf/
COPY run.sh ${CATALINA_HOME}/bin/run.sh

RUN useradd tomcat && \
	chown -R tomcat:tomcat ${CATALINA_HOME} && \
	chmod 0755 ${CATALINA_HOME}/bin/run.sh

USER tomcat

CMD [ "run.sh" ]
