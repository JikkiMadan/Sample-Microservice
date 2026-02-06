FROM ubuntu:22.04

ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-10.1.52
ENV PATH=$PATH:$TOMCAT_HOME/bin

RUN apt update -y && \
    apt install -y openjdk-17-jdk curl && \
    mkdir -p /u01/middleware

WORKDIR /u01/middleware

ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.52/bin/apache-tomcat-10.1.52.tar.gz .
RUN tar -xzvf apache-tomcat-10.1.52.tar.gz && rm apache-tomcat-10.1.52.tar.gz

# Deploy app (WAR is preferred for Tomcat)
COPY target/Sample-Microservice-0.0.1-SNAPSHOT.war \
     apache-tomcat-10.1.52/webapps/sample.war

COPY run.sh apache-tomcat-10.1.52/bin/run.sh
RUN chmod +x apache-tomcat-10.1.52/bin/run.sh

EXPOSE 8080

ENTRYPOINT ["/u01/middleware/apache-tomcat-10.1.52/bin/run.sh"]
