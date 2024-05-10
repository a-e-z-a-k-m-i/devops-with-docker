
# DevOps with Docker
## Part 1 | Exercise 1.10

In this exercise, we won't create a new Dockerfile.

The image `devopsdockeruh/simple-web-service` will start a web service in port `8080` when given the argument "server". In [Exercise 1.8](https://devopswithdocker.com/part-1/section-3#exercises-17---18) you already did an image that can be used to run the web service without any argument.

Use now the -p flag to access the contents with your browser. The output to your browser should be something like: `{ message: "You connected to the following path: ...`

Submit your used commands for this exercise.

```shell
[root@arch-01 ~]# docker build . -t web-server
Sending build context to Docker daemon   32.4MB
Step 1/2 : FROM devopsdockeruh/simple-web-service
 ---> 99f995eeaa58
Step 2/2 : CMD ["server"]
 ---> Running in cd8567295647
 ---> Removed intermediate container cd8567295647
 ---> a467b1e65d5a
Successfully built a467b1e65d5a
Successfully tagged web-server:latest
[root@arch-01 ~]# docker run -dp 8080:8080 web-server
d23cc6d809151564e7b6cffc13858f8991131c8a8c1b1e34b5e7de343de1bb33
[root@arch-01 ~]# curl localhost:8080
{"message":"You connected to the following path: /","path":"/"}
```
