# Cloud Infrastructure Interview test

The goal of this test is to "containerize" a sample application and write the necessary code to run it in a kubernetes cluster.

## 🛑 Requirements

- Docker
- apache2-utils package
- Kubernetes v1.28.2+
- Terraform 
- helm
- k3d
- Generate access token in the clouder provider
- Copy de access token to variables.tf

## 🚀 Installation

If you want to create your own application container image and push it on Docker Hub, use the following script: 
*Replace the "username" field in the script file with your Docker Hub username.

```bash
./image-build.sh
```

Use Terraform to configure the local and remote environment of your application:
 
```bash
./create-cluster.sh
```

Connect your local machine to the cloud provider:

1. Download the config file from kubernetes cluster located on your cloud provider;
2. Copy the config file to the kubernetes config directory. Replace the "config-file" in the next command with your config file name.

```bash
cp <config-file> ~/.kube/config
```

Deploy the application:

```bash
./deploy.sh
```
Run the tests scenarios:

```bash
./test.sh
```
