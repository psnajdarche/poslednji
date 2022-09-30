FROM openjdk:11

COPY /target/maven-hello-world-0.2.0.jar  /app/

WORKDIR /app

ENTRYPOINT ["java","-jar","/app/maven-hello-world-0.2.0.jar"]