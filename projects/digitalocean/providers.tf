terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    ssh = {
      source  = "loafoe/ssh"
      version = "2.6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.0-pre1"
    }
    rancher2 = {
      source  = "rancher/rancher2"
      version = "5.1.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

provider "rancher2" {
  api_url    = var.rancher_api_url
  access_key = var.rancher_access_key
  secret_key = var.rancher_secret_key
  insecure   = var.rancher_insecure
}
