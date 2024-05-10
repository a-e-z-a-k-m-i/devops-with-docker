
# DevOps with Docker
## Part 1 | Exercise 1.7

We can improve our previous solutions now that we know how to create and build a Dockerfile. Let us now get back to [Exercise 1.4](https://devopswithdocker.com/part-1/section-2#exercise-14). Create a new file `script.sh` on your local machine with the following contents:

```shell
while true
do
  echo "Input website:"
  read website; echo "Searching.."
  sleep 1; curl http://$website
done
```

Create a Dockerfile for a new image that starts from _ubuntu:22.04_ and add instructions to install `curl` into that image. Then add instructions to copy the script file into that image and finally set it to run on container start using CMD.  
After you have filled the Dockerfile, build the image with the name "curler".

> If you are getting permission denied, use `chmod` to give permission to run the script.

Remember that [RUN](https://docs.docker.com/engine/reference/builder/#run) can be used to execute commands while building the image!  
Submit the Dockerfile.

```shell
[root@arch-01 ~]# docker build . -t curler
Sending build context to Docker daemon  32.39MB
Step 1/5 : FROM ubuntu:22.04
 ---> 52882761a72a
Step 2/5 : RUN apt update
 ---> Using cache
 ---> 66e89fd21705
Step 3/5 : RUN apt install curl -y
 ---> Using cache
 ---> 99ca9a048b85
Step 4/5 : COPY script.sh /tmp/script.sh
 ---> Using cache
 ---> b2056e8cd356
Step 5/5 : CMD bash /tmp/script.sh
 ---> Using cache
 ---> 972e154677e6
Successfully built 972e154677e6
Successfully tagged curler:latest
```
