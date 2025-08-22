# 인터넷 게이트웨이 - 외부 통신용
resource "samsungcloudplatformv2_vpc_internet_gateway" "my_igw" {
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.igw_type 
  firewall_enabled = true
  firewall_loggable = false
  description = "Internet GW generated from Terraform"
  tags        = local.common_tags
}