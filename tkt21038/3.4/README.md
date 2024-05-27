
# DevOps with Docker
## Part 3 | Exercise 3.4

As seen from the Docker Compose file, the Watchtower uses a volume to [docker.sock](https://stackoverflow.com/questions/35110146/can-anyone-explain-docker-sock) socket to access the Docker daemon of the host from the container. In practice this means that Watchtower can run commands on Docker the same way we can "command" Docker from the cli with _docker ps_, _docker run_ etc.

We can easily use the same trick in our own scripts! So if we mount the _docker.sock_ socket to a container, we can use the command _docker_ inside the container, just like we are using it in the host terminal!

Dockerize now the script you did for the previous exercise. You can use images from [this repository](https://hub.docker.com/_/docker) to run Docker inside Docker!

Note that now the Docker Hub credentials are defined as environment variables since the script needs to log in to Docker Hub for the push.

Submit the Dockerfile and the final version of your script.

---

The script was modified to completely rely on variables taken either from host machine's environment, passed directly as parameters, or read from an .env file:  
https://docs.docker.com/reference/cli/docker/container/run/#env

- `GITHUB_URL`
- `DOCKER_HUB_REPOSITORY`
- `DOCKER_HUB_USER`
- `DOCKER_HUB_TOKEN`

```shell
[root@arch-01 ~]# docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
builder      latest    a092379e1b27   53 seconds ago   365MB
docker       latest    d14813e41c93   8 days ago       360MB
[root@arch-01 ~]# docker run -d --rm -v /var/run/docker.sock:/var/run/docker.sock --env GITHUB_URL --env DOCKER_HUB_REPOSITORY --env DOCKER_HUB_USER --env DOCKER_HUB_TOKEN builder
2bc589c8d40b6284cb0d7211729205679660b9004b210fd80cb946a54fe0063b
[root@arch-01 ~]# docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS           NAMES
2bc589c8d40b   builder   "/bin/bash builder.sh"   7 seconds ago   Up 6 seconds   2375-2376/tcp   intelligent_buck
```
