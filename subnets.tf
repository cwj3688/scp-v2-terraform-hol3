# [Public Subnet] 외부 로드밸런서 배치용 서브넷 (외부 서비스 관문)
resource "samsungcloudplatformv2_vpc_subnet" "lb_subnet" {
  name        = "${local.name_prefix}PUBSUB${local.environment}"
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.subnet_type
  cidr        = var.subnet_cidrs["lb"]
  description = "Public Subnet for External Loadbalancer generated from Terraform"
  tags        = local.common_tags
}

# [Private Subnet] 쿠버네티스(SKE) 클러스터 노드 배치용 서브넷 (내부망)
resource "samsungcloudplatformv2_vpc_subnet" "k8s_subnet" {
  name        = "${local.name_prefix}PRISUB${local.environment}"
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.subnet_type
  cidr        = var.subnet_cidrs["k8s"]
  description = "Private Subnet for Kubernetes Cluster Nodes generated from Terraform"
  tags        = local.common_tags
}

# [Private Subnet] 데이터베이스(DB) 인스턴스 배치용 서브넷 (보안 강화 구역)
resource "samsungcloudplatformv2_vpc_subnet" "db_subnet" {
  name        = "${local.name_prefix}DBSUB${local.environment}"
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.subnet_type
  cidr        = var.subnet_cidrs["db"]
  description = "Private Subnet for Database Instances generated from Terraform"
  tags        = local.common_tags
}