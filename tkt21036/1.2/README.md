
# DevOps with Docker
## Part 1 | Exercise 1.2

We have containers and an image that are no longer in use and are taking up space. Running `docker ps -a` and `docker image ls` will confirm this.  
Clean the Docker daemon by removing all images and containers.

```shell
[root@arch-01 ~]# docker container prune
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
0437e8f93876b092965a5adbffc5c289d11ca0a6a5f74172f18c1ad4cdd9ad8e
c82322421a0a8439369b645a078b06e5becb5ec523d6a1bedc911de14b7c19d7
9a2329d8733c8e7cf04b19d8215cb928e5152229ad997406fc8dd3a5566caefc

Total reclaimed space: 0B
[root@arch-01 ~]# docker rmi httpd:alpine
Untagged: httpd:alpine
Untagged: httpd@sha256:68f6714169b70ca33126c46f60cc802eb602c6435f4ebf08349d871d500d3e70
Deleted: sha256:43b6bf3450e2114fc55779cd878fa1a176a851a4de5a38f79ffb779639c455a2
Deleted: sha256:95f6d5efa88674fcd1572b1338f6a75dbd5e58f10782529942209d76ef2c68d9
Deleted: sha256:58c67d3d5c715128ff4be29a8056cf236c929d98ea881f8c0cccff4cbe3a1740
Deleted: sha256:9aaf7c75340998788c4d655c47eb47081a9c5630f98b16dc174e4fc13f68439d
Deleted: sha256:2ef2f65757f6f00f16f6e6b358f811e352fec6a5ea3c1dfa726ee600c1de0aa2
Deleted: sha256:563032ffe270eb7fb0a18d3edbf109cc60451548bf97fa78189ebef61c967d70
Deleted: sha256:6d33bd5473fd7b14ea7e033270c1fbdb28cb0b84d40b10d76375052001148f07
Deleted: sha256:d4fc045c9e3a848011de66f34b81f052d4f2c15a17bb196d637e526349601820
```

Submit the output for `docker ps -a` and `docker image ls`

```shell
[root@arch-01 ~]# docker ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[root@arch-01 ~]# docker image ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
```
