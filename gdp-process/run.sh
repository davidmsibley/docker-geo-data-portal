#!/bin/bash

if [ -z ${POSTGRES_PASSWORD} ]; then
	echo "Must provide db password \$POSTGRES_PASSWORD"
	exit 1
fi

if [ -z ${POSTGRES_USER} ]; then
	echo "Using default postgres user: postgres"
	POSTGRES_USER=postgres
fi

cat ${CATALINA_HOME}/conf/context.xml | envsubst > tmp.xml; mv tmp.xml ${CATALINA_HOME}/conf/context.xml
catalina.sh run
