# jenkins-as-code

Example repo to run fully automated, immutable Jenkins Masters in a container.

-----

### Build it

```sh
# Customize your jenkins master config via stuff in the files dir
export footerURL_host=127.0.0.1
docker build -t adampatts/jenkins-as-code:latest .
```

### Push it

```sh
docker push adampatts/jenkins-as-code:latest
```

### Run it

```sh
docker run -d \
  -p 8080:8080 \
  -p 50000:50000 \
  adampatts/jenkins-as-code:latest
```

**Reference:**

Jenkins Docker image:

https://github.com/jenkinsci/docker

Jenkins Configuration as Code plugin:

https://github.com/jenkinsci/configuration-as-code-plugin

Jenkins Config-as-code examples:

https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos
