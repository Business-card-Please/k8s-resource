FROM confluentinc/cp-kafka-connect:latest

# 환경 변수 설정
ENV DEBEZIUM_VERSION=1.9.7.Final \
    MARIADB_DRIVER_VERSION=3.1.4 \
    KAFKA_CONNECT_PLUGINS_DIR=/usr/share/java,/usr/share/confluent-hub-components

# Debezium MySQL 커넥터 및 MariaDB JDBC 드라이버 다운로드 및 설치
RUN curl -fsSL -o debezium.tgz https://repo1.maven.org/maven2/io/debezium/debezium-connector-mysql/${DEBEZIUM_VERSION}/debezium-connector-mysql-${DEBEZIUM_VERSION}-plugin.tar.gz \
    && tar -xzf debezium.tgz -C /usr/share/confluent-hub-components \
    && rm debezium.tgz \
    && curl -fsSL -o mariadb-driver.jar https://downloads.mariadb.com/Connectors/java/connector-java-${MARIADB_DRIVER_VERSION}/mariadb-java-client-${MARIADB_DRIVER_VERSION}.jar \
    && mv mariadb-driver.jar /usr/share/confluent-hub-components \
    && echo "Installed Debezium MySQL Connector and MariaDB JDBC Driver"

# 기본 엔트리포인트 및 CMD 유지
ENTRYPOINT ["/etc/confluent/docker/run"]