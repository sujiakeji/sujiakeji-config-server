dependencies: 
- docker
- jdk 8
- nexus
- gradle
- gitlab
- sujiakeji-eureka-server

update dependencies:
```
gradle dependencyUpdates -Drevision=release --info
```

build: 
```
cd sujiakeji-config-server
./gradlew idea
./gradlew clean build copyJar -x test
```

start:
```
java -Dspring.profiles.active=dev \
  -DEUREKA_SERVER_HOST=localhost \
  -DEUREKA_SERVER_PORT=9000 \
  -jar build/libs/sujiakeji-config-server.jar
```

docker:
```
./gradlew docker

docker build -t sujiakeji/sujiakeji-config-server:1.0.0-SNAPSHOT .

docker run -it --rm \
  --name sujiakeji-config-server \
  -p 9100:9100 \
  --link sujiakeji-eureka-server \
  -e EUREKA_SERVER_HOST=sujiakeji-eureka-server \
  -e EUREKA_SERVER_PORT=9000 \
  -e SPRING_PROFILES_ACTIVE=dev \
  sujiakeji/sujiakeji-config-server

docker-compose up
```
