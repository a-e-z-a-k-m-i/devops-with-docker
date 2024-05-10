
# DevOps with Docker
## Part 1 | Exercise 1.1

Since we already did "Hello, World!" in the material let's do something else.  
Start 3 containers from an image that does not automatically exit (such as nginx) in detached mode.

```shell
[root@arch-01 ~]# docker run -d httpd:alpine
Unable to find image 'httpd:alpine' locally
alpine: Pulling from library/httpd
4abcf2066143: Pull complete 
5e13f4f5374d: Pull complete 
333c1d8ec87c: Pull complete 
4f4fb700ef54: Pull complete 
58593e44a54d: Pull complete 
608381599c68: Pull complete 
d6e5ce613b31: Pull complete 
Digest: sha256:68f6714169b70ca33126c46f60cc802eb602c6435f4ebf08349d871d500d3e70
Status: Downloaded newer image for httpd:alpine
9a2329d8733c8e7cf04b19d8215cb928e5152229ad997406fc8dd3a5566caefc
[root@arch-01 ~]# docker run -d httpd:alpine
c82322421a0a8439369b645a078b06e5becb5ec523d6a1bedc911de14b7c19d7
[root@arch-01 ~]# docker run -d httpd:alpine
0437e8f93876b092965a5adbffc5c289d11ca0a6a5f74172f18c1ad4cdd9ad8e
```

Stop two of the containers and leave one container running.

```shell
[root@arch-01 ~]# docker stop 043 9a2
043
9a2
```

Submit the output for `docker ps -a` which shows 2 stopped containers and one running.

```shell
[root@arch-01 ~]# docker ps -a
CONTAINER ID   IMAGE          COMMAND              CREATED         STATUS                      PORTS     NAMES
0437e8f93876   httpd:alpine   "httpd-foreground"   2 minutes ago   Exited (0) 35 seconds ago             wizardly_cannon
c82322421a0a   httpd:alpine   "httpd-foreground"   2 minutes ago   Up 2 minutes                80/tcp    objective_shtern
9a2329d8733c   httpd:alpine   "httpd-foreground"   2 minutes ago   Exited (0) 35 seconds ago             infallible_merkle
```
