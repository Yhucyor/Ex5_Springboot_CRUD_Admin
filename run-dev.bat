@echo off
echo Starting Spring Boot Application...
set MAVEN_OPTS=-Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true
mvn spring-boot:run
