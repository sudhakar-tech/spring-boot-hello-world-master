FROM OpenJDK:11 as build
EXPOSE 8081
ADD target/hello-world-1.0.war hello-world-1.0.war
ENTRYPOINT ["java", "-war","/hello-world-1.0.war"]
