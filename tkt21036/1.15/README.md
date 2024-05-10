
# DevOps with Docker
## Part 1 | Exercise 1.15

Create Dockerfile for an application or any other dockerised project in any of your own repositories and publish it to Docker Hub. This can be any project, except the clones or forks of backend-example or frontend-example.

For this exercise to be complete you have to provide the link to the project in Docker Hub, make sure you at least have a basic description and instructions for how to run the application in a [README](https://help.github.com/en/articles/about-readmes) that's available through your submission.

---

The dockerised project for this exercise allows for convenient, one-off use of a popular CLI download utility. After desired content gets downloaded to user's current directory via bind mount, the container itself gets quietly removed, leaving no trace or leftovers on the host machine (as would be the case otherwise).

[Docker Hub repository](https://hub.docker.com/r/aezakml/yt-dlp)  
[Dockerfile](./Dockerfile)

Example usage:  
`docker run --rm -dv $(pwd):/usr/src/app aezakml/yt-dlp <URL>`

```shell
[root@arch-01 ~]# ls
[root@arch-01 ~]# docker image ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
[root@arch-01 ~]# docker run --rm -dv $(pwd):/usr/src/app aezakml/yt-dlp https://youtu.be/Z4xc3dXDE5I
Unable to find image 'aezakml/yt-dlp:latest' locally
latest: Pulling from aezakml/yt-dlp
a8b1c5f80c2d: Pull complete 
b84f46e060a2: Pull complete 
7ab1c8e00ef2: Pull complete 
339264519cb1: Pull complete 
c7a8dc67de71: Pull complete 
0eda36e21fcc: Pull complete 
Digest: sha256:e2b879ca04312041b508b7f4835afcc697e2b82b31a9f86445c4d1238608a3fa
Status: Downloaded newer image for aezakml/yt-dlp:latest
93320ccdb2bafcd78ccf9f951a0573d49b4ed7eb2c932bf8311cb51f5c37284a
[root@arch-01 ~]# docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[root@arch-01 ~]# ls
'O-Zone - Dragostea Din Tei (Official Video) [Z4xc3dXDE5I].mp4'
```
