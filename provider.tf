terraform {
  required_providers {
    samsungcloudplatformv2 = {
      version = "1.0.3"
      source = "samsungsdscloud/samsungcloudplatformv2"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.13.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4.5"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.2"
    }
  }
  required_version = ">= 1.11"
}

provider "samsungcloudplatformv2" {
}

provider "time" {
}

provider "http" {
}

provider "local" {
}