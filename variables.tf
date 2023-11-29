# Personal Access Token required to execute the script
variable "do_token" {
  default = "dop_v1_50c544689d72bb1958958c48deede9917546136a887577a7dd165e3ddb3df7a4"
}

# doctl k8s options regions
variable "k8s_region" {
  default = "ams3"
}

variable "k8s_clustername" {
  default = "terraform-cluster"
}

#  doctl k8s options versions
variable "k8s_version" {
  default = "1.28.2-do.0"
}

variable "k8s_poolname" {
  default = "app-pool"
}

# doctl k8s node size
variable "k8s_count" {
  default = "3"
}