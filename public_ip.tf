# [Public IP] 가상 리소스에 할당될 공인 IP 주소 자원

# 로드밸런서용 공인 IP
resource "samsungcloudplatformv2_vpc_publicip" "lb_publicip" {
    description = "Loadbalancer Public ip generated from Terraform"
    type = "IGW"
    tags = local.common_tags
}

# NAT 게이트웨이용 공인 IP
resource "samsungcloudplatformv2_vpc_publicip" "natgw_publicip" {
    description = "NAT Gateway Public ip generated from Terraform"
    type = "IGW"
    tags = local.common_tags
}