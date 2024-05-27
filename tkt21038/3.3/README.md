
# DevOps with Docker
## Part 3 | Exercise 3.3

Create a script/program that downloads a repository from GitHub, builds a Dockerfile located in the root and then publishes it into the Docker Hub.

You can use any scripting or programming language to implement the script. Using [shell script](https://www.shellscript.sh/) might make the next exercise a bit easier... and do not worry if you have not done a shell script earlier, you do not need much for this exercise and Google helps.  
The script could eg. be designed to be used so that as the first argument it gets the GitHub repository and as the second argument the Docker Hub repository.

For example when run as follows, the script clones https://github.com/mluukkai/express_app, builds the image, and pushes it to Docker Hub repository `mluukkai/testing`
```shell
./builder.sh mluukkai/express_app mluukkai/testing
```

---

```shell
[root@arch-01 ~]# ./builder.sh https://github.com/a-e-z-a-k-m-i/express-app testing
docker.io/aezakml/testing:latest
[root@arch-01 ~]# docker image ls
REPOSITORY        TAG       IMAGE ID       CREATED          SIZE
aezakml/testing   latest    df79ffd8d5b2   12 seconds ago   914MB
node              16        1ddc7e4055fd   8 months ago     909MB
```

![docker-hub-repo](assets/docker-hub-repo.png)
