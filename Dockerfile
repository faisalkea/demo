#FROM openjdk
#VOLUME /tmp
#ADD target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
#RUN sh -c 'touch /demo-0.0.1-SNAPSHOT'
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/demo-0.0.1-SNAPSHOT.jar"]

FROM java:8

#Author of the Docker File
MAINTAINER Faisal Jarkass (fafj@kea.dk)

# Install maven
RUN apt-get update
RUN apt-get install -y maven

WORKDIR /SpringBootDockerJar

VOLUME /tmp

# Prepare by downloading dependencies
ADD pom.xml /SpringBootDockerJar/pom.xml
RUN ["mvn", "dependency:resolve"]

# Adding source, compile and package into a fat jar
ADD src /SpringBootDockerJar/src

RUN ["mvn", "clean"]
RUN ["mvn", "package"]

#COPY /target/demo-0.0.1-SNAPSHOT.jar myapp.jar

#RUN sh -c 'touch /myapp.jar'
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/myapp.jar"]

CMD ["/usr/lib/jvm/java-8-openjdk-amd64/bin/java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]