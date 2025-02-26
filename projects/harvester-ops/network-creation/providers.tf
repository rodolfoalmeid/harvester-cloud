terraform {
  required_providers {
    harvester = {
      source  = "harvester/harvester"
      version = "0.6.6"
    }
    ssh = {
      source  = "loafoe/ssh"
      version = "2.6.0"
    }
  }
}
