
# DevOps with Docker
## Part 1 | Exercise 1.8

By default our `devopsdockeruh/simple-web-service:alpine` doesn't have a CMD. Instead, it uses _ENTRYPOINT_ to declare which application is run. We'll talk more about _ENTRYPOINT_ in the next section, but you already know that the last argument in `docker run` can be used to give a command or an argument.

As you might've noticed it doesn't start the web service even though the name is "simple-web-service". A suitable argument is needed to start the server!

In this exercise create a Dockerfile and use FROM and CMD to create a brand new image that automatically runs `server`. The Docker documentation [CMD](https://docs.docker.com/engine/reference/builder/#cmd) says a bit indirectly that if a image has ENTRYPOINT defined, CMD is used to define it the default arguments.  
Tag the new image as "web-server"  
Return the Dockerfile and the command you used to run the container.

We don't have any method of accessing the web service yet. As such confirming that the console output is the same will suffice. The exercise title may be a useful hint here.

```shell
[root@arch-01 ~]# vim Dockerfile
[root@arch-01 ~]# docker build . -t web-server
Sending build context to Docker daemon  32.39MB
Step 1/2 : FROM devopsdockeruh/simple-web-service:alpine
 ---> fd312adc88e0
Step 2/2 : CMD ["server"]
 ---> Running in 95db4a056ddd
 ---> Removed intermediate container 95db4a056ddd
 ---> 470fb16ce26d
Successfully built 470fb16ce26d
Successfully tagged web-server:latest
[root@arch-01 ~]# docker run web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```
