
# DevOps with Docker
## Part 3 | Exercise 3.6

Return now back to our [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend) and [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) Dockerfile.

Document both image sizes at this point, as was done in the material. Optimize the Dockerfiles of both app frontend and backend, by joining the RUN commands and removing useless parts.

After your improvements document the image sizes again.

---

| Docker image size | Exercise 3.5 | Exercise 3.6 |
| ----------------- | ------------ | ------------ |
| backend | 664 MB | 446 MB |
| frontend | 667 MB | 480 MB |

```shell
[root@arch-01 material-applications]# docker image ls
REPOSITORY   TAG           IMAGE ID       CREATED         SIZE
backend      latest        003ac05621d8   6 seconds ago   446MB
frontend     latest        f56c4b871480   2 minutes ago   480MB
node         16-alpine     2573171e0124   9 months ago    118MB
golang       1.16-alpine   7642119cd161   2 years ago     302MB
```
