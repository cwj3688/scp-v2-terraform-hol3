# 시스템 업데이트를 위한 아웃바운드 규칙
resource "samsungcloudplatformv2_firewall_firewall_rule" "my_igw_fwrule_systemupdate" {
  firewall_id = samsungcloudplatformv2_vpc_internet_gateway.my_igw.internet_gateway.firewall_id
  firewall_rule_create = {
    action = "ALLOW"
    description = "Rule from terraform"
    destination_address = ["0.0.0.0/0"]         # 모든 대상
    direction = "OUTBOUND"
    service = [{
      service_type = "TCP"
      service_value = "80"
    },
    {
      service_type = "TCP"
      service_value = "443"
    }]
    source_address = ["192.168.50.0/24"]   # k8s 서브넷
    status = "ENABLE"
  }
}

# 웹 서비스 인바운드 접근 규칙
resource "samsungcloudplatformv2_firewall_firewall_rule" "my_igw_fwrule_webservice" {
  firewall_id = samsungcloudplatformv2_vpc_internet_gateway.my_igw.internet_gateway.firewall_id
  firewall_rule_create = {
    action = "ALLOW"
    description = "Rule from terraform"
    destination_address = ["192.168.0.0/24"]   # Loadbalancer 서비스 IP 대역
    direction = "INBOUND"
    service = [{
      service_type = "TCP"
      service_value = "80"
    },
    {
      service_type = "TCP"
      service_value = "443"
    }]
    source_address = ["0.0.0.0/0"]         # 모든 소스
    status = "ENABLE"
  }
  depends_on  = [samsungcloudplatformv2_firewall_firewall_rule.my_igw_fwrule_systemupdate]
}

# 쿠버네티스 API 접근 규칙
resource "samsungcloudplatformv2_firewall_firewall_rule" "my_igw_fwrule_k8s" {
  firewall_id = samsungcloudplatformv2_vpc_internet_gateway.my_igw.internet_gateway.firewall_id
  firewall_rule_create = {
    action = "ALLOW"
    description = "Rule from terraform"
    destination_address = ["192.168.50.0/24"]                 # k8s 서브넷
    direction = "INBOUND"
    service = [{
      service_type = "TCP"
      service_value = "80"
    },
    {
      service_type = "TCP"
      service_value = "443"
    },
    {
      service_type = "TCP"
      service_value = "6443"
    }]
    source_address = ["${local.my_current_ip_address}"]  # 현재 IP만 허용
    status = "ENABLE"
  }
  depends_on  = [samsungcloudplatformv2_firewall_firewall_rule.my_igw_fwrule_webservice]
}




# # --------------------------------------------------------------------

# # 시스템 업데이트를 위한 아웃바운드 규칙
# resource "samsungcloudplatform_firewall_rule" "my_igw_fwrule_systemupdate" {
#   firewall_id = samsungcloudplatformv2_vpc_internet_gateway.my_igw.firewall_id
#   direction   = "OUT"                       # 아웃바운드 트래픽
#   action      = "ALLOW"                     # 허용 규칙

#   source_addresses_ipv4      = ["192.168.50.0/24"]   # k8s 서브넷
#   destination_addresses_ipv4 = ["0.0.0.0/0"]         # 모든 대상

#   # HTTP/HTTPS 포트 허용
#   service {
#     type  = "TCP"
#     value = "80"
#   }
#   service {
#     type  = "TCP"
#     value = "443"
#   }

#   description = "Rule from terraform"
# }

# # 웹 서비스 인바운드 접근 규칙
# resource "samsungcloudplatform_firewall_rule" "my_igw_fwrule_webservice" {
#   firewall_id = samsungcloudplatformv2_firewall_firewall.my_igw_fw.id
#   direction   = "IN"                        # 인바운드 트래픽
#   action      = "ALLOW"                     # 허용 규칙

#   source_addresses_ipv4      = ["0.0.0.0/0"]         # 모든 소스
#   destination_addresses_ipv4 = ["192.168.150.0/24"]   # Loadbalancer 서비스 IP 대역

#   # HTTP/HTTPS 포트 허용
#   service {
#     type  = "TCP"
#     value = "80"
#   }
#   service {
#     type  = "TCP"
#     value = "443"
#   }

#   description = "Rule from terraform"
# }

# # 쿠버네티스 API 접근 규칙
# resource "samsungcloudplatform_firewall_rule" "my_igw_fwrule_k8s" {
#   firewall_id = samsungcloudplatformv2_firewall_firewall.my_igw_fw.id
#   direction   = "IN"                        # 인바운드 트래픽
#   action      = "ALLOW"                     # 허용 규칙

#   source_addresses_ipv4      = ["${local.my_current_ip_address}"]  # 현재 IP만 허용
#   destination_addresses_ipv4 = ["192.168.50.0/24"]                 # k8s 서브넷

#   # HTTP/HTTPS 포트 허용
#   service {
#     type  = "TCP"
#     value = "80"
#   }
#   service {
#     type  = "TCP"
#     value = "443"
#   }
#   service {
#     type  = "TCP"
#     value = "6443"
#   }

#   description = "Rule from terraform"
# }