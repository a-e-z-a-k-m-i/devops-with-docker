
# DevOps with Docker
## Part 3 | Exercise 3.10

Do all or most of the optimizations from security to size for **one** other Dockerfile you have access to, in your own project or for example the ones used in previous "standalone" exercises.

Please document Dockerfiles both before and after.

---

| Docker image size | Exercise 1.11 | Exercise 3.10 |
| ----------------- | ------------- | ------------- |
| simple-button | 292 MB | 129 MB |

**Exercise 1.11**  
Dockerfile: [spring-example-project](../../tkt21036/1.11/Dockerfile)  
**Exercise 3.10**  
Dockerfile: [spring-example-project](./Dockerfile)  

```shell
[root@arch-01 spring-example-project]# docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                                         NAMES
234a6b038b45   simple-button:3.10   "java -jar docker-ex…"   53 seconds ago   Up 53 seconds   0.0.0.0:32770->8080/tcp, :::32770->8080/tcp   optimistic_chaplygin
3bbfa8969916   simple-button:1.11   "java -jar ./target/…"   33 minutes ago   Up 33 minutes   0.0.0.0:32768->8080/tcp, :::32768->8080/tcp   priceless_mcnulty
[root@arch-01 spring-example-project]# docker image ls
REPOSITORY          TAG        IMAGE ID       CREATED              SIZE
simple-button       3.10       463bd9d88582   About a minute ago   129MB
simple-button       1.11       f55d30d4da8c   34 minutes ago       292MB
amazoncorretto      8-alpine   493f3cbe04e6   5 weeks ago          207MB
maslick/minimalka   latest     d88a34e7789e   2 years ago          110MB
```
![spring-example-project](assets/spring-example-project.png)
