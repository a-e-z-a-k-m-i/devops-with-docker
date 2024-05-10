
# DevOps with Docker
## Part 1 | Exercise 1.16

It is time to wrap up this part and run a containerized app in the cloud.

You can take any web-app, eg. an example or exercise from this part, your own app, or even the course material (see [devopsdockeruh/coursepage](https://hub.docker.com/r/devopsdockeruh/coursepage)) and deploy it to some cloud provider.

There are plenty of alternatives, and most provide a free tier. Here are some alternatives that are quite simple to use:
- [fly.io](https://fly.io/)
- [render.com](https://render.com/)
- [heroku.com](https://heroku.com/)

Submit the Dockerfile, a brief description of what you did, and a link to the running app.

---

Deployed the course material website as a Fly.io app running on a 256M 1vCPU VPS instance, built from its GitHub repo provided in one of the previous sections.

__Step 1:__  
Set up CLI utility (_script runs on Linux and macOS only_)  
```shell
[root@arch-01 ~]# curl -L https://fly.io/install.sh | sh
```

__Step 2:__  
Login/Authentication  
```shell
[root@arch-01 ~]# fly auth login
```

__Step 3:__  
App deployment  
```shell
[root@arch-01 ~]# fly launch --from=https://github.com/docker-hy/docker-hy.github.io --generate-name --internal-port=80 --max-concurrent=1 --ha=false --vm-memory=256mb --vm-size=shared-cpu-1x --vm-cpus=1 --vm-cpu-kind=shared
```

Confirm that the app and its machine were properly provisioned and booted up with `fly status` or using their dashboard.

```shell
[root@arch-01 ~]# fly status --app patient-flower-6160
App
  Name     = patient-flower-6160                                        
  Owner    = personal                                                   
  Hostname = patient-flower-6160.fly.dev                                
  Image    = patient-flower-6160:deployment-01HXDECE3GWAJEC1FNZTTSB0V2  

Machines
PROCESS ID              VERSION REGION  STATE   ROLE    CHECKS  LAST UPDATED         
app     17815116a50d78  1       lhr     started                 2024-05-09T21:00:56Z
```

Dockerfile:  
https://github.com/docker-hy/docker-hy.github.io/raw/master/Dockerfile

Live app:  
https://patient-flower-6160.fly.dev/
