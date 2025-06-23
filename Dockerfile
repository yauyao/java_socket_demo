# 建構階段：使用 Maven 建構 Spring Boot 專案
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# 下載原始碼
RUN git clone --depth=1 https://github.com/yauyao/java_socket_demo.git .

# 使用 Maven 打包（跳過測試）
RUN mvn clean package -DskipTests

# 執行階段：使用輕量級 JRE 執行 jar
FROM openjdk:21-jdk-slim

WORKDIR /app

# 複製 jar 檔案（假設名稱為 websocketdemo-0.0.1-SNAPSHOT.jar）
COPY --from=build /app/target/websocketdemo-0.0.1-SNAPSHOT.jar app.jar

# 開放 Spring Boot 預設 port（8080），可依實際程式碼調整
EXPOSE 8080

# 執行 Spring Boot 應用
ENTRYPOINT ["java", "-jar", "app.jar"]
