# Cloud Infrastructure Interview test

The goal of this test is to "containerize" a sample application and write the necessary code to run it in a kubernetes cluster.

## 🛑 Requirements

- Docker
- apache2-utils package
- Kubernetes v1.28.2+
- Terraform 
- helm
- k3d

## 🚀 Installation

If you want to create your own application container image and push it on Docker Hub, use the following script:

*Replace the "username" field in the script file with your Docker Hub username.

```bash
./image-build.sh
```
Generate access token in the clouder provider
Use this documetation for digitalocean
-https://docs.digitalocean.com/reference/api/create-personal-access-token/#:~:text=To%20generate%20a%20personal%20access,the%20Generate%20New%20Token%20button

Use this documetation for AWS
-https://circleci.awsworkshop.io/ee/040_circleci_setup/43_terraform_cloud_token.html

Use this command for GCP
```bash
gcloud auth print-access-token
```
For another cloud provider you can search how to generete your acess-token.
*Replace the access-token in the variables.tf with your genereted access-token.

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
