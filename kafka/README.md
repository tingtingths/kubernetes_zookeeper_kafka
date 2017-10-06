## Kafka

An apache kafka docker image with Kubernetes cluster config included.

## Prerequisite

One or more instances of zookeeper should be running in advance.

## To run with Kubernetes

Config
```bash
Modify options in conf/* as needed.
Modify assigned resources as needed in kf-cluster.yaml
```

Build
```bash
/bin/bash build.sh
```

Deploy
```bash
kubectl create -f kf-cluster.yaml
```