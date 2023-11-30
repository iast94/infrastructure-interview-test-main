# Personal Access Token required to execute the script
variable "do_token" {
  default = "dop_v1_24e553ac3fc94af8f7b09577050fe631da5d37246821ddbaf4f3aac10b87623c"
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