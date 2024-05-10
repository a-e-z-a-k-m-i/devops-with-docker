
# DevOps with Docker
## Part 1 | Exercise 1.3

Now that we've warmed up it's time to get inside a container while it's running!  
Image `devopsdockeruh/simple-web-service:ubuntu` will start a container that outputs logs into a file. Go inside the running container and use `tail -f ./text.log` to follow the logs. Every 10 seconds the clock will send you a "secret message".

```shell
[root@arch-01 ~]# docker run -d --name=secret devopsdockeruh/simple-web-service:ubuntu
Unable to find image 'devopsdockeruh/simple-web-service:ubuntu' locally
ubuntu: Pulling from devopsdockeruh/simple-web-service
5d3b2c2d21bb: Pull complete 
3fc2062ea667: Pull complete 
75adf526d75b: Pull complete 
965d4bbb586a: Pull complete 
4f4fb700ef54: Pull complete 
Digest: sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a
Status: Downloaded newer image for devopsdockeruh/simple-web-service:ubuntu
c2d7ed97c4cc5e4e0c951109c0e29a43b1bb239c29c519a4d9f3a5ad41f08a21
```

Submit the secret message and command(s) given as your answer.

```shell
[root@arch-01 ~]# docker exec -it secret tail -f ./text.log
2024-05-05 17:57:41 +0000 UTC
2024-05-05 17:57:43 +0000 UTC
2024-05-05 17:57:45 +0000 UTC
2024-05-05 17:57:47 +0000 UTC
2024-05-05 17:57:49 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
```
