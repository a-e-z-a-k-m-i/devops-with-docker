
# DevOps with Docker
## Part 2 | Exercise 2.10

Now we have the reverse proxy up and running! All the communication to our app should be done through the reverse proxy and direct access (eg. accessing the backend with a GET to http://localhost:8080/ping ) should be prevented.

Use a port scanner, eg https://hub.docker.com/r/networkstatic/nmap to ensure that there are no extra ports open in the host. It might be enough to just run:
```shell
docker run -it --rm --network host networkstatic/nmap localhost
```
As we see, there are two suspicious open ports: 5000 and 8080. So it is obvious that the frontend and backend are still directly accessible in the host network. This should be fixed!

You are done when the port scan report looks something like this:
```shell
PORT    STATE    SERVICE
80/tcp  filtered http
111/tcp open     rpcbind
```

---

Since containers are able to communicate internally over the bridge driver network they are all assigned to, publishing internal service ports is both redundant and insecure:  
https://docs.docker.com/network/#published-ports

> [!CAUTION]
> Publishing container ports is insecure by default. Meaning, when you publish a container's ports it becomes available not only to the Docker host, but to the outside world as well.  

Published port bindings are now removed for both the frontend (`5000:5000`) and backend app (`8080:8080`) as Nginx already routes all incoming requests directly to their containers.

```shell
[root@arch-01 ~]# docker compose up -d
[+] Running 6/6
 ✔ Network fullstack        Created                                                                                                                                         0.1s 
 ✔ Container database       Started                                                                                                                                         1.1s 
 ✔ Container cache          Started                                                                                                                                         1.1s 
 ✔ Container backend        Started                                                                                                                                         1.5s 
 ✔ Container frontend       Started                                                                                                                                         2.0s 
 ✔ Container reverse-proxy  Started                                                                                                                                         2.8s 
[root@arch-01 ~]# docker compose ps
NAME            IMAGE             COMMAND                  SERVICE         CREATED         STATUS         PORTS
backend         backend           "/bin/sh -c ./server"    backend         8 seconds ago   Up 5 seconds   8080/tcp
cache           redis:alpine      "docker-entrypoint.s…"   cache           8 seconds ago   Up 6 seconds   6379/tcp
database        postgres:alpine   "docker-entrypoint.s…"   database        8 seconds ago   Up 6 seconds   5432/tcp
frontend        frontend          "docker-entrypoint.s…"   frontend        8 seconds ago   Up 5 seconds   5000/tcp
reverse-proxy   nginx:alpine      "/docker-entrypoint.…"   reverse-proxy   8 seconds ago   Up 4 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp
[root@arch-01 ~]# curl localhost:8080/ping
curl: (7) Failed to connect to localhost port 8080: Connection refused
[root@arch-01 ~]# curl localhost:80/api/ping
pong
[root@arch-01 ~]# docker run -it --rm --network host networkstatic/nmap localhost
Starting Nmap 7.92 ( https://nmap.org ) at 2024-05-18 00:45 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0000040s latency).
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
80/tcp open  http

Nmap done: 1 IP address (1 host up) scanned in 0.11 seconds
```
