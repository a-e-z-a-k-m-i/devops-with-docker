
# DevOps with Docker
## Part 1 | Exercise 1.5

In the [Exercise 1.3](https://devopswithdocker.com/part-1/section-2#exercise-13) we used `devopsdockeruh/simple-web-service:ubuntu`. Here is the same application but instead of Ubuntu is using [Alpine Linux](https://www.alpinelinux.org/): `devopsdockeruh/simple-web-service:alpine`.  
Pull both images and compare the image sizes.

```shell
[root@arch-01 ~]# docker pull devopsdockeruh/simple-web-service:alpine
alpine: Pulling from devopsdockeruh/simple-web-service
ba3557a56b15: Pull complete 
1dace236434b: Pull complete 
4f4fb700ef54: Pull complete 
Digest: sha256:dd4d367476f86b7d7579d3379fe446ae5dfce25480903fb0966fc2e5257e0543
Status: Downloaded newer image for devopsdockeruh/simple-web-service:alpine
docker.io/devopsdockeruh/simple-web-service:alpine
[root@arch-01 ~]# docker image ls
REPOSITORY                          TAG       IMAGE ID       CREATED       SIZE
ubuntu                              latest    bf3dc08bfed0   6 days ago    76.2MB
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   3 years ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   3 years ago   15.7MB
```

Go inside the Alpine container and make sure the secret message functionality is the same. Alpine version doesn't have `bash` but it has `sh`, a more bare-bones shell.

```shell
[root@arch-01 ~]# docker run -d --rm -it devopsdockeruh/simple-web-service:alpine
1a257007bc0e46563e629539fac2b6c106d92ae5e4136c654dc5994b4863ec03
[root@arch-01 ~]# docker exec -it 1a2 tail -f ./text.log
2024-05-05 19:16:30 +0000 UTC
2024-05-05 19:16:32 +0000 UTC
2024-05-05 19:16:34 +0000 UTC
2024-05-05 19:16:36 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
```
