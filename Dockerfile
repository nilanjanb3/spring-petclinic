FROM maven

RUN mkdir -p /src/app
WORKDIR /src/app

COPY . /src/app
RUN mvn package

CMD ["java", "-jar", "/src/app/target/spring-petclinic-3.1.0-SNAPSHOT.jar"]
