
# DevOps with Docker
## Part 3 | Exercise 3.1

Create now a similar deployment pipeline for a simple Node.js/Express app found [here](https://github.com/docker-hy/material-applications/tree/main/express-app).

Either clone the project or copy the files to your own repository. Set up a similar deployment pipeline using GitHub Actions that was just described. Ensure that a new image gets pushed to Docker Hub every time you push the code to GitHub (you may eg. change the message the app shows).

Keep an eye on the GitHub Actions page to see that your workflow is working. Ensure also from Docker Hub that your image gets pushed there.

Next, run your image locally in detached mode, and ensure that you can access it with the browser.
Now set up and run the [Watchtower](https://github.com/containrrr/watchtower) just as described above.
You might do these two in a single step in a shared Docker Compose file.

Ensure that it works:
- make a change to your code
- commit and push the changes to GitHub
- wait for some time
- reload the browser to ensure your changes are visible

Submit a link to the repository with the config.

---

GitHub repository:  
https://github.com/a-e-z-a-k-m-i/express-app

```shell
[root@arch-01 ~]# docker compose up -d
[+] Running 3/3
 ✔ Network root_default   Created                                                                                                                                                     0.2s 
 ✔ Container express-app  Started                                                                                                                                                     0.9s 
 ✔ Container watchtower   Started                                                                                                                                                     1.3s 
[root@arch-01 ~]# docker compose ps
NAME          IMAGE                   COMMAND                  SERVICE       CREATED         STATUS                            PORTS
express-app   aezakml/express-app     "docker-entrypoint.s…"   express-app   6 seconds ago   Up 6 seconds                      0.0.0.0:8080->8080/tcp, :::8080->8080/tcp
watchtower    containrrr/watchtower   "/watchtower express…"   watchtower    6 seconds ago   Up 5 seconds (health: starting)   8080/tcp
```

```yaml
watchtower  | time="2024-05-21T23:02:34Z" level=info msg="Found new aezakml/express-app:latest image (e4f754d902f0)"
watchtower  | time="2024-05-21T23:02:34Z" level=info msg="Stopping /express-app (2da6f88352b6) with SIGTERM"
watchtower  | time="2024-05-21T23:02:45Z" level=info msg="Creating /express-app"
```
