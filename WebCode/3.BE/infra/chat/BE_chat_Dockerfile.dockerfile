FROM openjdk:24-ea-jdk-oraclelinux9

WORKDIR /app

COPY dev/chat/build/libs/chat-0.0.1-SNAPSHOT.jar chat-0.0.1-SNAPSHOT.jar

EXPOSE 9992

ENTRYPOINT ["java", "-jar", "chat-0.0.1-SNAPSHOT.jar"]