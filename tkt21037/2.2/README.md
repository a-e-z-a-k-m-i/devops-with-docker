
# DevOps with Docker
## Part 2 | Exercise 2.2

Read about how to add the command to docker-compose.yml from the [documentation](https://docs.docker.com/compose/compose-file/).

The familiar image `devopsdockeruh/simple-web-service` can be used to start a web service, see the [exercise 1.10](https://devopswithdocker.com/part-1/section-5#exercise-110).  
Create a docker-compose.yml, and use it to start the service so that you can use it with your browser.

Submit the docker-compose.yml, and make sure that it works simply by running `docker compose up`

---

```shell
[root@arch-01 ~]# vim docker-compose.yml 
[root@arch-01 ~]# docker compose up -d
[+] Running 2/2
 ✔ Network root_default                 Created                                                                                                                                       0.1s 
 ✔ Container root-simple-web-service-1  Started                                                                                                                                       0.6s 
[root@arch-01 ~]# curl localhost:8080
{"message":"You connected to the following path: /","path":"/"}
```
