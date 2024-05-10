
# DevOps with Docker
## Part 1 | Exercise 1.13

Clone, fork or download a project from https://github.com/docker-hy/material-applications/tree/main/example-backend.

Create a Dockerfile for the project (example-backend). Start the container with port 8080 published.
When you start the container and navigate to http://localhost:8080/ping you should get a "pong" as a response.

Submit the Dockerfile and the command used.  
_Do not alter the code of the project_

```shell
[root@arch-01 example-backend]# vim Dockerfile
[root@arch-01 example-backend]# docker build . -t backend
Sending build context to Docker daemon   42.5kB
Step 1/8 : FROM golang:1.16
 ---> 972d8c0bc0fc
Step 2/8 : WORKDIR /usr/src/app
 ---> Running in 17a54d9658da
Removing intermediate container 17a54d9658da
 ---> 4270f2c278f7
Step 3/8 : COPY ./ ./
 ---> 1342df44da44
Step 4/8 : RUN go build
 ---> Running in b8defb803b59
go: downloading github.com/gin-contrib/cors v1.3.1
go: downloading github.com/gin-gonic/gin v1.6.3
go: downloading github.com/gin-contrib/sse v0.1.0
go: downloading github.com/mattn/go-isatty v0.0.12
go: downloading github.com/go-redis/redis/v8 v8.4.2
go: downloading github.com/go-pg/pg/v10 v10.7.3
go: downloading github.com/go-playground/validator/v10 v10.2.0
go: downloading github.com/golang/protobuf v1.4.3
go: downloading github.com/ugorji/go v1.1.7
go: downloading github.com/ugorji/go/codec v1.1.7
go: downloading gopkg.in/yaml.v2 v2.3.0
go: downloading golang.org/x/sys v0.0.0-20201119102817-f84b799fce68
go: downloading github.com/cespare/xxhash/v2 v2.1.1
go: downloading github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f
go: downloading go.opentelemetry.io/otel v0.14.0
go: downloading mellium.im/sasl v0.2.1
go: downloading github.com/go-pg/zerochecker v0.2.0
go: downloading github.com/jinzhu/inflection v1.0.0
go: downloading github.com/vmihailenco/msgpack/v5 v5.0.0
go: downloading github.com/vmihailenco/tagparser v0.1.2
go: downloading github.com/go-playground/universal-translator v0.17.0
go: downloading github.com/leodido/go-urn v1.2.0
go: downloading google.golang.org/protobuf v1.25.0
go: downloading github.com/tmthrgd/go-hex v0.0.0-20190904060850-447a3041c3bc
go: downloading github.com/vmihailenco/bufpool v0.1.11
go: downloading golang.org/x/crypto v0.0.0-20201117144127-c1f2f97bffc9
go: downloading github.com/go-playground/locales v0.13.0
Removing intermediate container b8defb803b59
 ---> 8cee181eddbb
Step 5/8 : RUN go test ./...
 ---> Running in 679d73811e0a
ok      server  0.008s
?       server/cache    [no test files]
ok      server/common   0.002s
?       server/controller       [no test files]
?       server/pgconnection     [no test files]
?       server/router   [no test files]
Removing intermediate container 679d73811e0a
 ---> 03459347f724
Step 6/8 : ENV PORT=8080
 ---> Running in 4d3c740329cc
Removing intermediate container 4d3c740329cc
 ---> fdf4709e47f8
Step 7/8 : EXPOSE $PORT
 ---> Running in 72487c1b889b
Removing intermediate container 72487c1b889b
 ---> c0e1f6fbaf91
Step 8/8 : CMD ./server
 ---> Running in d02514df1b58
Removing intermediate container d02514df1b58
 ---> 8649f5e1d3bc
Successfully built 8649f5e1d3bc
Successfully tagged backend:latest
[root@arch-01 example-backend]# docker run -dp 8080:8080 backend
80e3dfefb58d8e41197872f3d7f395e0f0cef764bd99e21b75e99cddde695102
[root@arch-01 example-backend]# curl localhost:8080/ping
pong
```
