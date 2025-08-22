resource "samsungcloudplatformv2_vpc_nat_gateway" "natgateway" {
    subnet_id = samsungcloudplatformv2_vpc_subnet.k8s_subnet.id
    publicip_id = samsungcloudplatformv2_vpc_publicip.natgw_publicip.id
    description = "NAT Gateway generated from Terraform"
    tags = local.common_tags
}