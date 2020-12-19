terraform {
  required_providers {
    acme = {
      source = "vancluever/acme"
      version = "1.6.3"
    }
  }
}

provider "acme" {
  server_url = var.acme_server_url
}

