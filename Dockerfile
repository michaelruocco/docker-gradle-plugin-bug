FROM adoptopenjdk/openjdk11

USER 10001

COPY build/libs/gradle-docker-plugin-bug-*.jar /opt/app.jar
EXPOSE 8080

CMD ["java","-Djava.security.egd=file:/dev/./urandom","-Xmx256m", "-jar", "/opt/app.jar"]