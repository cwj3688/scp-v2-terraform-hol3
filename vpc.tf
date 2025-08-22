# VPC 리소스 - 기본 네트워크 구성
resource "samsungcloudplatformv2_vpc_vpc" "my_vpc" {
  name        = "${local.name_prefix}-vpc-${local.environment}"
  cidr        = var.vpc_cidr
  description = "Vpc generated from Terraform"
  tags        = local.common_tags
}