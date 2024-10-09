FROM confluentinc/cp-kafka-connect:latest

# 환경 변수 설정
ENV DEBEZIUM_VERSION=1.9.7.Final \
    MARIADB_DRIVER_VERSION=3.1.4 \
    KAFKA_CONNECT_PLUGINS_DIR=/usr/share/java

# Debezium MySQL 커넥터 및 MariaDB JDBC 드라이버 다운로드 및 설치
RUN curl -fsSL -o debezium.tgz https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/${DEBEZIUM_VERSION}/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz \
    && tar -xzf debezium.tgz -C ${KAFKA_CONNECT_PLUGINS_DIR} \
    && rm debezium.tgz \
    && curl -fsSL -o mariadb-driver.jar https://downloads.mariadb.com/Connectors/java/connector-java-${MARIADB_DRIVER_VERSION}/mariadb-java-client-${MARIADB_DRIVER_VERSION}.jar \
    && mv mariadb-driver.jar ${KAFKA_CONNECT_PLUGINS_DIR} \
    && echo "Installed Debezium MySQL Connector and MariaDB JDBC Driver"

# 컨테이너 시작 시 실행할 명령 설정
CMD ["connect-distributed", "/etc/kafka/connect-distributed.properties"]