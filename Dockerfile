# base image centos7
FROM centos:7

# updating all packages
# Installing java-jdk package
RUN yum update -y && \
yum install -y wget && \
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
yum clean all

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz
RUN tar -xvf apache-tomcat-9.0.64.tar.gz
RUN mv apache-tomcat-9.0.64/* /opt/tomcat/.
COPY target/studentapp-2.2-SNAPSHOT.war /opt/tomcat/webapps/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
