
# DevOps with Docker
## Part 1 | Exercise 1.4

Start a Ubuntu image with the process `sh -c 'while true; do echo "Input website:"; read website; echo "Searching.."; sleep 1; curl http://$website; done'`  
You will notice that a few things required for proper execution are missing. Be sure to remind yourself which flags to use so that the container actually waits for input.
> Note also that curl is NOT installed in the container yet. You will have to install it from inside of the container.

```shell
[root@arch-01 ~]# docker run -it ubuntu sh -c 'apt-get update -qq; apt-get install curl -y > /dev/null; while true; do read -p "Input website: " website; echo "Searching.."; sleep 1; curl http://$website; done'
```

Test inputting `helsinki.fi` into the application. This time return the command you used to start process and the command(s) you used to fix the ensuing problems.

```html
Input website: helsinki.fi
Searching..
<html>
<head><title>301 Moved Permanently</title></head>
<body>
<center><h1>301 Moved Permanently</h1></center>
<hr><center>nginx/1.22.1</center>
</body>
</html>
```
