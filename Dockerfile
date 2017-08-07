FROM openjdk

VOLUME /tmp
ADD target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar
RUN sh -c 'touch /demo-0.0.1-SNAPSHOT'

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/demo-0.0.1-SNAPSHOT.jar"]