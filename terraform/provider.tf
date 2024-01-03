# Configure the Provider
terraform {
  required_providers {
    <your-provider> = {
      source  = "<your-provider>/<your-provider>"
      version = "~> <your-provider-version>"
    }
  }
}
provider "<your-provider>" {
  token = var.do_token
}
