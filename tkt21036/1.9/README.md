
# DevOps with Docker
## Part 1 | Exercise 1.9

In this exercise we won't create a new Dockerfile. Image `devopsdockeruh/simple-web-service` creates a timestamp every two seconds to `/usr/src/app/text.log` when it's not given a command. Start the container with a bind mount so that the logs are created into your filesystem.

Submit the command you used to complete the exercise.

```shell
[root@arch-01 ~]# > text.log
[root@arch-01 ~]# docker run -dv $(pwd)/text.log:/usr/src/app/text.log devopsdockeruh/simple-web-service
4a63b83e4761b3fdc86fbe7b76c20b5a622f6067f777adab6dc7534dd19f7ba4
[root@arch-01 ~]# cat text.log
2024-05-06 18:05:12 +0000 UTC
2024-05-06 18:05:14 +0000 UTC
2024-05-06 18:05:16 +0000 UTC
2024-05-06 18:05:18 +0000 UTC
2024-05-06 18:05:20 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2024-05-06 18:05:22 +0000 UTC
2024-05-06 18:05:24 +0000 UTC
2024-05-06 18:05:26 +0000 UTC
```
