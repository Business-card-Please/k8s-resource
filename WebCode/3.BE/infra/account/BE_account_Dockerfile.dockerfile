FROM openjdk:24-ea-jdk-oraclelinux9

WORKDIR /app

COPY dev/account/build/libs/account-0.0.1-SNAPSHOT.jar account-0.0.1-SNAPSHOT.jar

EXPOSE 9990

ENTRYPOINT ["java", "-jar", "account-0.0.1-SNAPSHOT.jar"]