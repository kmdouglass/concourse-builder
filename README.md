# Concourse Builder

- Clone the [Concourse repository](https://github.com/concourse/concourse)
- Inside the root-directory of the repository, build Concourse with the following command:

```
docker run --rm -v $(pwd):/home/concourse-builder/src kmdouglass/concourse-builder build
```
