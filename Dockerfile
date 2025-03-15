FROM maven:3.8-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM tomcat:9-jdk11
COPY --from=build /app/target/*.jar /usr/local/tomcat/webapps/ROOT.jar
EXPOSE 8080
CMD ["catalina.sh", "run"]