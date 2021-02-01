#!/bin/bash

#This is for testing
#CONNECTOR_HOME_DIR=.

#CONNECTOR_PROPERTIES_FILE=${CONNECTOR_HOME_DIR}/configuration/connector.properties;
#echo "************Properties start************"
#cat ${CONNECTOR_PROPERTIES_FILE}
#echo
#echo "************Properties end************"
#
#echo
#echo "************While start************"
#while read line; do
#  echo "$line"
#  export "$line"
#done < ${CONNECTOR_PROPERTIES_FILE}
#echo "************While end************"
#
#tmp1=$(mktemp)
#tmp2=$(mktemp)
#
#cut -d= -f 1 ${CONNECTOR_PROPERTIES_FILE}  | tr '[:lower:]' '[:upper:]' | tr '.-' '_' > $tmp1
#cut -d= -f 2 ${CONNECTOR_PROPERTIES_FILE} > $tmp2
#
#paste -d= $tmp1 $tmp2 > output.props
#
#sed -i 's/ *= */=/' output.props
##sed -i 's/^/export /' output.props
#
#rm $tmp1 $tmp2

export CONNECT_BOOTSTRAP_SERVERS=PLAINTEXT://broker:9092
export CONNECT_GROUP_ID=compose-connect-group
export CONNECT_CONFIG_STORAGE_TOPIC=docker-connect-configs
export CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR=1
export CONNECT_OFFSET_FLUSH_INTERVAL_MS=10000
export CONNECT_OFFSET_STORAGE_TOPIC=docker-connect-offsets
export CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR=1
export CONNECT_STATUS_STORAGE_TOPIC=docker-connect-status
export CONNECT_STATUS_STORAGE_REPLICATION_FACTOR=1
export CONNECT_KEY_CONVERTER=org.apache.kafka.connect.storage.StringConverter
export CONNECT_VALUE_CONVERTER=org.apache.kafka.connect.storage.StringConverter
export CONNECT_REST_ADVERTISED_HOST_NAME=localhost

/etc/confluent/docker/run