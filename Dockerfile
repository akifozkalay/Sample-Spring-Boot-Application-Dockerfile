FROM openjdk:8-jdk-alpine
RUN apk add maven
RUN mvn -v
WORKDIR /srv
COPY . /srv
RUN mvn package spring-boot:repackage


WORKDIR /usr/src/java-app
RUN ls -all
RUN cp /srv/target/*.jar ./app.jar
RUN ls -all
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]


