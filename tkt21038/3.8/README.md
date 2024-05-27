
# DevOps with Docker
## Part 3 | Exercise 3.8

Do now a multi-stage build for the example [frontend](https://github.com/docker-hy/material-applications/tree/main/example-frontend).

Even though multi-stage builds are designed mostly for binaries in mind, we can leverage the benefits with our frontend project as having original source code with the final assets makes little sense. Build it with the instructions in README and the built assets should be in `build` folder.

You can still use the `serve` to serve the static files or try out something else.

---

| Docker image size | Exercise 3.5 | Exercise 3.6 | Exercise 3.7 | Exercise 3.8 |
| ----------------- | ------------ | ------------ | ------------ | ------------ |
| backend | 664 MB | 446 MB | 316 MB | 316 MB |
| frontend | 667 MB | 480 MB | 305 MB | 120 MB |

Build optimizations no longer have to be executed as part of an intermediate build stage; only static assets are copied to the final image anyways.
