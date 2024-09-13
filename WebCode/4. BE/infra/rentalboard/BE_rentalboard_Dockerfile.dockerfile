FROM openjdk:24-ea-jdk-oraclelinux9

WORKDIR /app

COPY dev/rentalboard/build/libs/rentalboard-0.0.1-SNAPSHOT.jar rentalboard-0.0.1-SNAPSHOT.jar

EXPOSE 9991

ENTRYPOINT ["java", "-jar", "rentalboard-0.0.1-SNAPSHOT.jar"]