# 테라폼 및 프로바이더 요구사항 정의
terraform {
  required_providers {
    samsungcloudplatformv2 = {
      version = "3.1.5"
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

# 삼성 클라우드 플랫폼(SCP) v2 프로바이더 설정
provider "samsungcloudplatformv2" {
}

provider "time" {
}

provider "http" {
}

provider "local" {
}