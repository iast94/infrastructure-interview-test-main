# Configure the Provider

##Digitalocean Provider
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

##AWS Provider
#terraform {
#  required_providers {
#    aws = {
#      source  = "hashicorp/aws"
#      version = "~> 5.0"
#    }
#  }
#}

##GCP Provider
#terraform {
#  required_providers {
#    google = {
#      source = "hashicorp/google"
#      version = "4.51.0"
#    }
#  }
#}

provider "<your-provider>" {
  token = var.do_token
}
