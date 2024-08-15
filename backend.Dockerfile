# JDK 17 기반
FROM openjdk:17-jdk

# image 에 포함되어 있지 않아서 추가
RUN microdnf install findutils

# 이동
WORKDIR /app/project_backend

COPY ./project_backend /app/project_backend

RUN tr -d '\r' < ./gradlew > ./gradlew_unix
RUN mv ./gradlew_unix ./gradlew

RUN chmod +x ./gradlew

RUN ./gradlew clean

RUN ./gradlew build

# 권한
RUN chmod +x ./build/libs/backend-0.0.1-SNAPSHOT.jar

# 생략시 들어갈 포트
EXPOSE 8080

# 실행
CMD ["java", "-jar", "./build/libs/backend-0.0.1-SNAPSHOT.jar"]
