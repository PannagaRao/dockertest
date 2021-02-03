# use a node base image
# FROM confluentinc/cp-kafka-connect-base:5.5.3
# COPY quickstart-s3.properties /opt/s3.properties
# RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:5.5.3
# FROM confluentinc/cp-server-connect-base:6.0.1
# set maintainer
# LABEL maintainer "crudsinfotechng@gmail.com"

# # set a health check
# HEALTHCHECK --interval=5s \
#             --timeout=5s \
#             CMD curl -f http://127.0.0.1:8000 || exit 1

# # tell docker what port to expose
# EXPOSE 8000
FROM confluentinc/cp-kafka-connect-base:5.5.3

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:5.5.3

ARG CONNECTOR_HOME_DIR=/opt/kafka-connector
COPY configuration ${CONNECTOR_HOME_DIR}/configuration
COPY scripts ${CONNECTOR_HOME_DIR}/scripts

ENV CONNECT_BOOTSTRAP_SERVERS="b-3.test123.5xhhgb.c9.kafka.us-east-1.amazonaws.com:9092"
ENV CONNECT_REST_PORT=8083
ENV CONNECT_GROUP_ID="compose-connect-group"
ENV CONNECT_CONFIG_STORAGE_TOPIC="test-connect-configs"
ENV CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR=1
ENV CONNECT_OFFSET_FLUSH_INTERVAL_MS=10000
ENV CONNECT_OFFSET_STORAGE_TOPIC="test-connect-offsets"
ENV CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR=1
ENV CONNECT_STATUS_STORAGE_TOPIC="test-connect-status"
ENV CONNECT_STATUS_STORAGE_REPLICATION_FACTOR=1
ENV CONNECT_KEY_CONVERTER="org.apache.kafka.connect.storage.StringConverter"
ENV CONNECT_VALUE_CONVERTER="org.apache.kafka.connect.storage.StringConverter"
ENV CONNECT_REST_ADVERTISED_HOST_NAME="localhost"
