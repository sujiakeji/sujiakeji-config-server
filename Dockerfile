FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=build/dependency
COPY ${DEPENDENCY}/BOOT-INF/classes /app
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
ENTRYPOINT ["java","-cp","app:app/lib/*","com.sujiakeji.config.server.Application"]
EXPOSE 9100
