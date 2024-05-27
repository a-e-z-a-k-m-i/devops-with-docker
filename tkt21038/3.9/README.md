
# DevOps with Docker
## Part 3 | Exercise 3.9

Let us do a multi-stage build for the [backend](https://github.com/docker-hy/material-applications/tree/main/example-backend) project since we've come so far with the application.

The project is in Golang and building a binary that runs in a container, while straightforward, isn't exactly trivial. Use resources that you have available (Google, example projects) to build the binary and run it inside a container that uses `FROM scratch`.

To successfully complete the exercise the image must be smaller than **25MB**.

---

| Docker image size | Exercise 3.5 | Exercise 3.6 | Exercise 3.7 | Exercise 3.8 | Exercise 3.9 |
| ----------------- | ------------ | ------------ | ------------ | ------------ | ------------ |
| backend | 664 MB | 446 MB | 316 MB | 316 MB | 9.02 MB |
| frontend | 667 MB | 480 MB | 305 MB | 120 MB | 120 MB |

Alpine `CGO_ENABLED` builds:  
https://megamorf.gitlab.io/2019/09/08/alpine-go-builds-with-cgo-enabled/

The compiled server binary cannot depend on any C libraries given that runtime build stage is based on the completely empty `scratch` image, as per exercise requirements.
