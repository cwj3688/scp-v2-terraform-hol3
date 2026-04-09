# NAT 게이트웨이 (NAT Gateway) - 프라이빗 서브넷의 리소스가 보안을 유지하면서 외부(인터넷)로 나갈 수 있도록 지원
resource "samsungcloudplatformv2_vpc_nat_gateway" "natgateway" {
    subnet_id = samsungcloudplatformv2_vpc_subnet.k8s_subnet.id
    publicip_id = samsungcloudplatformv2_vpc_publicip.natgw_publicip.id
    description = "NAT Gateway generated from Terraform"
    tags = local.common_tags
}