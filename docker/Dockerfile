# 1. 베이스 이미지 설정
FROM openjdk:17

# 2. 작업 디렉토리 생성
WORKDIR /app

# 3. JAR 파일 복사
COPY /build/libs/Final-PJT-0.0.1-SNAPSHOT.jar app.jar

# 4. 포트 명시
EXPOSE 8080

# 5. 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
