# Cloud Infrastructure

The goal of this test is to "containerize" a sample application and write the necessary code to run it in a kubernetes cluster.

## 🛑 Requirements

- Docker
- apache2-utils package
- Kubernetes v1.28.2+
- Terraform 
- helm
- k3d

## 🚀 Installation

### Image build and push to dockerhub
To create your own application container image and push it on Docker Hub, the first step is to log in to the DockerHub registry with the following command:
```bash
docker login
```
*Replace in the script file (image-build.sh) and in the values.yaml file (located inside the kube-news folder) the "username" with your Docker Hub username and the "image-name" with the name you want to provide for the image.

Now you can use the following script:
```bash
./image-build.sh
```
### Create local and cloud cluster
#### Generate access token in the clouder provider
Use this documetation for digitalocean:

https://docs.digitalocean.com/reference/api/create-personal-access-token/#:~:text=To%20generate%20a%20personal%20access,the%20Generate%20New%20Token%20button

Use this documetation for AWS:

https://circleci.awsworkshop.io/ee/040_circleci_setup/43_terraform_cloud_token.html

Use this command for GCP
```bash
gcloud auth print-access-token
```
For another cloud provider you can search how to generete your acess-token.

*Replace the access-token in the variables.tf file located in the terraform folder with your generated access token.

*Chose your provider configurarion in the provider.tf

Use Terraform to configure the local and remote environment of your application:
 
```bash
./create-cluster.sh
```
###  Deploy the kubernetes aplication
To Pull an Image from a Private Registry you first need to create a Secret based on existing credentials, to do this use the following docmuentation:

https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/

After that, replace your dockerhub secret in the "dockerhub-secret" field in the my-secret.yaml file, located inside the kube-news/templates folder.

#### Connect your local machine to the cloud provider:

1. Download the config file from kubernetes cluster located on your cloud provider;
2. Copy the config file to the kubernetes config directory. Replace the "config-file" in the next command with your config file name.

```bash
cp "config-file" ~/.kube/config
```

#### Deploy the application:

```bash
./deploy.sh
```
### Run the tests scenarios:

```bash
./test.sh
```
