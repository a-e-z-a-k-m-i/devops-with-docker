
# DevOps with Docker
## Part 2 | Exercise 2.5

The project https://github.com/docker-hy/material-applications/tree/main/scaling-exercise is a barely working application. Go ahead and clone it for yourself. The project already includes docker-compose.yml so you can start it by running `docker compose up`.

The application should be accessible through http://localhost:3000. However it doesn't work well enough and we've added a load balancer for scaling. Your task is to scale the `compute` containers so that the button in the application turns green.

Please return the used commands for this exercise.  
_This exercise was created with [Sasu Mäkinen](https://github.com/sasumaki)_

---

```shell
[root@arch-01 scaling-exercise]# docker compose up -d
WARN[0000] /root/material-applications/scaling-exercise/docker-compose.yml: `version` is obsolete 
[+] Running 4/4
 ✔ Network scaling-exercise_default      Created                                                                                                                                                           0.0s 
 ✔ Container load-balancer               Started                                                                                                                                                           0.3s 
 ✔ Container calculator                  Started                                                                                                                                                           0.4s 
 ✔ Container scaling-exercise-compute-1  Started                                                                                                                                                           0.2s 
[root@arch-01 scaling-exercise]# docker compose scale compute=3
WARN[0000] /root/material-applications/scaling-exercise/docker-compose.yml: `version` is obsolete 
[+] Running 3/3
 ✔ Container scaling-exercise-compute-1  Running                                                                                                                                                           0.0s 
 ✔ Container scaling-exercise-compute-3  Started                                                                                                                                                           0.2s 
 ✔ Container scaling-exercise-compute-2  Started                                                                                                                                                           0.3s 
```

![scaling-exercise](assets/scaling-exercise.png)

Scaling services is also possible by directly specifying the `deploy.replicas` attribute, for example:
```yaml
services:
    web-server:
        image: nginx
        deploy:
            replicas: 3
        ports:
            - 80
```
