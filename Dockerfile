FROM OpenJDK:11 as build
EXPOSE 8081
ADD target/spring-hello-world.war spring-hello-world.war
ENTRYPOINT ["java", "-war","/spring-hello-world.war"]
