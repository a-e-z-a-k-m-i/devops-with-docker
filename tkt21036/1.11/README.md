
# DevOps with Docker
## Part 1 | Exercise 1.11

Create a Dockerfile for an old Java Spring project that can be found from the [course repository](https://github.com/docker-hy/material-applications/tree/main/spring-example-project). The setup should be straightforward with the README instructions. Tips to get you started:

There are many options for running Java, you may use eg. [amazoncorretto](https://hub.docker.com/_/amazoncorretto) `FROM amazoncorretto:_tag_` to get Java instead of installing it manually. Pick the tag by using the README and Docker Hub page.

You've completed the exercise when you see a 'Success' message in your browser.  
Submit the Dockerfile you used to run the container.

```shell
[root@arch-01 spring-example-project]# vim Dockerfile
[root@arch-01 spring-example-project]# docker build . -t simple-button
Sending build context to Docker daemon  44.54kB
Step 1/6 : FROM amazoncorretto:8-alpine
 ---> 493f3cbe04e6
Step 2/6 : WORKDIR /usr/src/app
 ---> Using cache
 ---> 075e1ca7feec
Step 3/6 : COPY ./ ./
 ---> 4d41a16bbb50
Step 4/6 : RUN ./mvnw package --quiet
 ---> Running in 491bef661af9
Connecting to repo.maven.apache.org (151.101.0.215:443)
saving to '/usr/src/app/.mvn/wrapper/maven-wrapper.jar'
maven-wrapper.jar    100% |********************************| 48337  0:00:00 ETA
'/usr/src/app/.mvn/wrapper/maven-wrapper.jar' saved
Removing intermediate container 491bef661af9
 ---> 67dc904bb876
Step 5/6 : EXPOSE 8080
 ---> Running in ca9fb52cbde8
Removing intermediate container ca9fb52cbde8
 ---> e316fc113465
Step 6/6 : CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
 ---> Running in c9e549077e60
Removing intermediate container c9e549077e60
 ---> 94134f99c29d
Successfully built 94134f99c29d
Successfully tagged simple-button:latest
[root@arch-01 spring-example-project]# docker run -dp 8080:8080 simple-button
383fb2847c3e50e7a3f771a78a2f5fbfc75e12477a470d6b8ba044e90a3d1a96
```
![simple-button-app](assets/simple-button-app.png)
