# VPC (Virtual Private Cloud) 리소스 - 프로젝트의 논리적으로 격리된 기본 가상 네트워크 구성
resource "samsungcloudplatformv2_vpc_vpc" "my_vpc" {
  name        = "${local.name_prefix}-vpc-${local.environment}"
  cidr        = var.vpc_cidr
  description = "Primary VPC for SCP v2 HOL3 environment"
  tags        = local.common_tags
}