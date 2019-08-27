FROM openjdk:8-jre-alpine
MAINTAINER dev@sling.apache.org

RUN mkdir -p /opt/sling
COPY target/sling-cloud-native-*.jar /opt/sling/sling.jar

WORKDIR /opt/sling
EXPOSE 8080
VOLUME /opt/sling/sling

ENV JAVA_OPTS -Xmx512m
ENV SLING_OPTS ''

CMD exec java $JAVA_OPTS -jar sling.jar $SLING_OPTS
