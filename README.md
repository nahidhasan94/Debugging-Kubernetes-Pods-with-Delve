# Debugging Kubernetes Pods with Delve
This repository provides a simple guide and a set of examples for debugging Go applications running inside Kubernetes pods using Delve. Delve is a popular debugger for Go that provides powerful features for tracing and debugging Go code.

- A docker file is attached in this repository
- Build a docker image by ```DOCKER_BUILDKIT=1 docker build -t <image tag> .```
- Push the image in your registry(here i am using dockerhub) ```docker push <image tag>```
- Follow [all.yaml](https://github.com/shabrul2451/Debugging-Kubernetes-Pods-with-Delve/blob/master/all.yaml) to deploy
- After deploying on kubernetes ```exec``` the pod by
```kubectl exec -it <pod tag> /bin/bash```
- After exec ```dlv --listen=:<debug port> --headless=true --api-version=2 --accept-multiclient attach 1```
- In goland set a breakpoint in your code by clicking on the left margin of the editor or by using the keyboard shortcut Ctrl + F8 (Windows/Linux) or Command + F8 (macOS)
- Click on the "Run/Debug Configurations" dropdown in the top right corner of the IDE and select "Edit Configurations"
- Click on the "+" icon in the top left corner of the dialog and select "Go Remote" from the dropdown
- Configure the remote debugging options by setting the following fields:
```
- "Name": Enter a name for the configuration.
- "Host": localhost
- "Port": Enter the port number that Delve is listening on. This should be the same port number that you used when starting Delve in the terminal.
```
- Click "OK" to save the configuration
- Run the Go application by selecting "Run" from the main menu and choosing the Go Remote configuration that you just created.
- If you ping now it will send you to the break point
