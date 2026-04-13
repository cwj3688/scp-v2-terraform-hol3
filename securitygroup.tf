# [LB Security Group] 외부 로드밸런서용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "lb_sg" {
  name        = "${local.name_prefix}-lb-SG-${local.environment}"
  description = "Security Group  generated from Terraform"
  loggable = false
  tags        = local.common_tags
}

# 쿠버네티스 클러스터용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "k8s_sg" {
  name        = "${local.name_prefix}-k8s-SG-${local.environment}"
  description = "Security Group  generated from Terraform"
  loggable = false
  tags        = local.common_tags
}

# 데이터베이스용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "db_sg" {
  name        = "${local.name_prefix}-db-SG-${local.environment}"
  description = "Security Group  generated from Terraform"
  loggable = false
  tags        = local.common_tags
}

# 보안 그룹 규칙 정의 (반복문 사용)
locals {
  sg_rules = {
    lb_http = {
      sg_id       = samsungcloudplatformv2_security_group_security_group.lb_sg.id
      direction   = "ingress"
      port        = 80
      remote_ip   = "0.0.0.0/0"
      description = "Allow Inbound HTTP (80) for Loadbalancer"
    }
    lb_https = {
      sg_id       = samsungcloudplatformv2_security_group_security_group.lb_sg.id
      direction   = "ingress"
      port        = 443
      remote_ip   = "0.0.0.0/0"
      description = "Allow Inbound HTTPS (443) for Loadbalancer"
    }
    k8s_kubectl = {
      sg_id       = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
      direction   = "ingress"
      port        = 6443
      remote_ip   = local.my_current_ip_address
      description = "Allow Inbound Kubernetes API (6443) from My IP"
    }
    k8s_update_http = {
      sg_id       = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
      direction   = "egress"
      port        = 80
      remote_ip   = "0.0.0.0/0"
      description = "Allow Outbound HTTP (80) for System Updates"
    }
    k8s_update_https = {
      sg_id       = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
      direction   = "egress"
      port        = 443
      remote_ip   = "0.0.0.0/0"
      description = "Allow Outbound HTTPS (443) for System Updates"
    }
  }
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "sg_rules" {
  for_each          = local.sg_rules
  security_group_id = each.value.sg_id
  direction         = each.value.direction
  ethertype         = "IPv4"
  protocol          = "TCP"
  port_range_min    = each.value.port
  port_range_max    = each.value.port
  remote_ip_prefix  = each.value.remote_ip
  description       = each.value.description
}