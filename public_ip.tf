# loadbalancer public ip
resource "samsungcloudplatformv2_vpc_publicip" "lb_publicip" {
    description = "Loadbalancer Public ip"
    type = "IGW"
    tags = local.common_tags
}

resource "samsungcloudplatformv2_vpc_publicip" "natgw_publicip" {
    description = "NAT Gateway Public ip"
    type = "IGW"
    tags = local.common_tags
}