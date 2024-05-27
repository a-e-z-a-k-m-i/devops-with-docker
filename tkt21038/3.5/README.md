
# DevOps with Docker
## Part 3 | Exercise 3.5

In exercises [1.12](https://devopswithdocker.com/part-1/section-6#exercises-111-114) and [1.13](https://devopswithdocker.com/part-1/section-6#exercises-111-114) we created Dockerfiles for both [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend).

Security issues with the user being a root are serious for the example frontend and backend as the containers for web services are supposed to be accessible through the Internet.  
The backend image is based on [Alpine Linux](https://www.alpinelinux.org/), which does not support the command `useradd`. Google will surely help you a way to create a user in an `alpine` based image.

Make sure the containers start their processes as non-root user.  
Submit the Dockerfiles.

---

User accounts/groups for `alpine` based images:  
https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user

Dockerfile: [backend](backend/Dockerfile)  
Dockerfile: [frontend](frontend/Dockerfile)

This exercise refers to Dockerfiles from 1.12 and 1.13 specifically, and none of the frontend app tests were implemented at that point.

```shell
[root@arch-01 material-applications]# docker run -dp 8080:8080 backend
9f6b272f255013fb3e2a41c4898ce940c526009e9a61faf89ed3f7951e1ae0ab
[root@arch-01 material-applications]# docker run -dp 5000:5000 frontend
efd21e1fad7a883ac61ef3525756cf9b8d89ae421b2f30ea14af4589dd8c405a
[root@arch-01 material-applications]# docker ps
CONTAINER ID   IMAGE      COMMAND                  CREATED          STATUS          PORTS                                       NAMES
efd21e1fad7a   frontend   "docker-entrypoint.s…"   5 seconds ago    Up 4 seconds    0.0.0.0:5000->5000/tcp, :::5000->5000/tcp   zen_lalande
9f6b272f2550   backend    "/bin/sh -c ./server"    12 seconds ago   Up 11 seconds   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp   pedantic_jemison
[root@arch-01 material-applications]# docker exec -it efd21e1fad7a ps aux
PID   USER     TIME  COMMAND
    1 frontend  0:00 node /usr/local/bin/serve -s -l 5000 build
   17 frontend  0:00 ps aux
[root@arch-01 material-applications]# docker exec -it 9f6b272f2550 ps aux
PID   USER     TIME  COMMAND
    1 backend   0:00 ./server
   10 backend   0:00 ps aux
```
