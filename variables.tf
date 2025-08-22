# 인터넷 게이트웨이 설정
variable "igw_type" {
  type = string
  default = "IGW"
}

# VPC 네트워크 CIDR 설정
variable "vpc_cidr" {
  type = string
  default = "192.168.0.0/16"
}

# 서브넷 타입 설정
variable "subnet_type" {
  type = string
  default = "GENERAL"
}

# 서브넷 네트워크 CIDR 설정
variable "subnet_cidrs" {
  description = "서브넷 CIDR 블록 맵"
  type        = map(string)
  default     = {
    lb      = "192.168.0.0/24"
    k8s     = "192.168.50.0/24"
    db      = "192.168.100.0/24"
  }
}

variable "lb_cidr" {
  description = "로드밸런서 CIDR 블록"
  type        = string
  default     = "192.168.150.0/27"
}

# 시간 설정
variable "vpc_wait_time" {
  description = "VPC 생성 후 대기 시간 (초)"
  type        = string
  default     = "30s"
}

# 쿠버네티스 설정
variable "kubernetes_version" {
  description = "쿠버네티스 엔진 버전"
  type        = string
  default     = "v1.31.8"
}