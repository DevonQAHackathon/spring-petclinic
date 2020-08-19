FROM openjdk:8-jdk-alpine
COPY target/*.jar ./*.jar
EXPOSE  8080 80 3306
ENTRYPOINT ["java","-jar","*.jar"]