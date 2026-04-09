# 인터넷 게이트웨이 (Internet Gateway) - VPC와 인터넷 간의 통신을 가능하게 하는 관문
resource "samsungcloudplatformv2_vpc_internet_gateway" "my_igw" {
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.igw_type 
  firewall_enabled = true
  firewall_loggable = false
  description = "Internet Gateway for External Connectivity"
  tags        = local.common_tags
}