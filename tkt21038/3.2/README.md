
# DevOps with Docker
## Part 3 | Exercise 3.2

In [Exercise 1.16](https://devopswithdocker.com/part-1/section-6#exercises-115-116) you deployed a containerized app to a cloud service.

Now it is time to improve your solution by setting up a deployment pipeline for it so that every push to GitHub results in a new deployment to the cloud service.
You will most likely find a ready-made GitHub Action that does most of the heavy lifting your you... Google is your friend!

Submit a link to the repository with the config.  
The repository README should have a link to the deployed application.

---

Cloud provider `fly.io` has their own [GitHub action](https://github.com/marketplace/actions/github-action-for-flyctl) that builds and deploys a new Docker image whenever an app's source code gets updated:  
https://fly.io/docs/app-guides/continuous-deployment-with-github-actions/

GitHub repository:  
https://github.com/a-e-z-a-k-m-i/docker-hy

![deployment-activity](assets/deployment-activity.png)

Deployed app:  
https://bitter-mountain-1952.fly.dev/

![ci-updated-app](assets/ci-updated-app.png)
