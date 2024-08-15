# JDK 17 기반
FROM openjdk:17-jdk

# image 에 포함되어 있지 않아서 추가
RUN microdnf install findutils

# 이동
WORKDIR /app/project_backend

COPY ./build/backend-0.0.1-SNAPSHOT.jar /app/project_backend

# 권한
RUN chmod +x ./backend-0.0.1-SNAPSHOT.jar

# 생략시 들어갈 포트
EXPOSE 8080

# 실행
CMD ["java", "-jar", "./backend-0.0.1-SNAPSHOT.jar"]

