# 배스천 호스트용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "lb_sg" {
  name        = "${local.name_prefix}-lb-SG-${local.environment}"
  description = "SecurityGroup generated from terraform"
  loggable = false
  tags        = local.common_tags
}

# 쿠버네티스 클러스터용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "k8s_sg" {
  name        = "${local.name_prefix}-k8s-SG-${local.environment}"
  description = "SecurityGroup generated from terraform"
  loggable = false
  tags        = local.common_tags
}

# 데이터베이스용 보안 그룹
resource "samsungcloudplatformv2_security_group_security_group" "db_sg" {
  name        = "${local.name_prefix}-db-SG-${local.environment}"
  description = "SecurityGroup generated from terraform"
  loggable = false
  tags        = local.common_tags
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_lb_http" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.lb_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 80
  port_range_max    = 80
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_lb_https" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.lb_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 443
  port_range_max    = 443
  depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_lb_http]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_kubectl" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "ingress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "${local.my_current_ip_address}"
  port_range_min    = 6443
  port_range_max    = 6443
  # depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_k8s_https]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_update_http" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 80
  port_range_max    = 80
  depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_kubectl]
}

resource "samsungcloudplatformv2_security_group_security_group_rule" "my_sg_rule_update_https" {
  security_group_id = samsungcloudplatformv2_security_group_security_group.k8s_sg.id
  ethertype         = "IPv4"
  protocol          = "TCP"
  direction         = "egress"
  description       = "SecurityGroup Rule generated from Terraform"
  remote_ip_prefix  = "0.0.0.0/0"
  port_range_min    = 443
  port_range_max    = 443
  depends_on  = [samsungcloudplatformv2_security_group_security_group_rule.my_sg_rule_update_http]
}