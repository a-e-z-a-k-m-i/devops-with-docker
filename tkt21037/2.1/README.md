
# DevOps with Docker
## Part 2 | Exercise 2.1

Let us now leverage the Docker Compose with the simple webservice that we used in the [Exercise 1.3](https://devopswithdocker.com/part-1/section-2#exercise-13)

Without a command `devopsdockeruh/simple-web-service` will create logs into its `/usr/src/app/text.log`. Create a docker-compose.yml file that starts `devopsdockeruh/simple-web-service` and saves the logs into your filesystem.

Submit the docker-compose.yml, and make sure that it works simply by running `docker compose up` if the log file exists.

---

```shell
[root@arch-01 ~]# > text.log
[root@arch-01 ~]# docker compose up -d
[+] Running 2/2
 ✔ Network root_default                 Created                                                                                                                                       0.1s 
 ✔ Container root-simple-web-service-1  Started                                                                                                                                       0.4s 
[root@arch-01 ~]# cat text.log
2024-05-14 14:10:57 +0000 UTC
2024-05-14 14:10:59 +0000 UTC
2024-05-14 14:11:01 +0000 UTC
2024-05-14 14:11:03 +0000 UTC
2024-05-14 14:11:05 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-05-14 14:11:07 +0000 UTC
```
