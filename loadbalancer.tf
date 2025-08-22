# # 쿠버네티스 서비스 노출을 위한 로드밸런서
# resource "samsungcloudplatformv2_loadbalancer_loadbalancer" "my_lb" {
#   loadbalancer_create = {
#     description = "LoadBalancer generated from Terraform"
#     firewall_enabled = false
#     firewall_logging_enabled= false
#     layer_type= "L4"
#     name= "${local.name_prefix}-LB-${local.environment}"
#     publicip_id= null
#     service_ip= null
#     subnet_id= samsungcloudplatformv2_vpc_subnet.lb_subnet.id
#     vpc_id= samsungcloudplatformv2_vpc_vpc.my_vpc.id
#   }
# #   vpc_id      = samsungcloudplatform_vpc.my_vpc.id
# #   name        = "${local.name_prefix}LB${local.environment}"
# #   description = "LoadBalancer generated from Terraform"
# #   size        = "SMALL"                     # 로드밸런서 크기 설정
# #   cidr_ipv4   = var.lb_cidr                # 로드밸런서 네트워크 대역
# #   tags        = local.common_tags
# }



# resource "samsungcloudplatformv2_loadbalancer_loadbalancer_public_nat_ip" "loadbalancerpublicnatip" {
#   static_nat_create = {
#     publicip_id = samsungcloudplatformv2_vpc_publicip.lb_publicip.id
#   }
#   loadbalancer_id = samsungcloudplatformv2_loadbalancer_loadbalancer.my_lb.id
# }