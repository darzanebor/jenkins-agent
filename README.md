### Jenkins Agent with Img builder tool
# 
#### Usage in Kubernetes ([Kubernetes Jenkins Plugin](https://plugins.jenkins.io/kubernetes/))
# 
##### Kubernetes Jenkins Plugin Config
```
---
Work Directory: /home/jenkins
Arguments: ${computer.jnlpmac} ${computer.name} 
Image: alphaceti/jenkins-agent:0.0.2
Container name: jnlp
Run As User ID: 1000
Run As Group ID: 1000
```
# 
##### Raw Pod Template (Merge strategy)
```
---
spec:
  containers:
  -  name: "jnlp"
     securityContext:
       privileged: true
```
# 
##### Annotations
```
---
container.seccomp.security.alpha.kubernetes.io/jnlp: unconfined
container.apparmor.security.beta.kubernetes.io/jnlp: unconfined
```
#
##### Jenkinsfile
```
...
stage("Main build") {
  sh(returnStdout: true, script: 'img build -t user/myimage -f Dockerfile . && img ls')
}
...
```

##### Tools

Jenkins Agent with root-less OCI compatible image builder [Img.](https://github.com/genuinetools/img)

<a href="./img/Jenkins.png"><img src="./img/Jenkins.png" title="pylint"></a>
