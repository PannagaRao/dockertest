# use a node base image
FROM confluentinc/cp-kafka-connect-base:5.5.3
COPY quickstart-s3.properties /opt/s3.properties
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-s3:5.5.3
# FROM confluentinc/cp-server-connect-base:6.0.1
# set maintainer
# LABEL maintainer "crudsinfotechng@gmail.com"

# # set a health check
# HEALTHCHECK --interval=5s \
#             --timeout=5s \
#             CMD curl -f http://127.0.0.1:8000 || exit 1

# # tell docker what port to expose
# EXPOSE 8000
