# 로드밸런서를 위한 퍼블릭 서브넷
resource "samsungcloudplatformv2_vpc_subnet" "lb_subnet" {
  name        = "${local.name_prefix}PUBSUB${local.environment}"
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.subnet_type
  cidr        = var.subnet_cidrs["lb"]
  description = "Loadbalancer  Subnet"
  tags        = local.common_tags
  # depends_on  = [time_sleep.wait_after_vpc]
#   depends_on  = [samsungcloudplatform_internet_gateway.my_igw]
}

# 쿠버네티스 클러스터를 위한 프라이빗 서브넷
resource "samsungcloudplatformv2_vpc_subnet" "k8s_subnet" {
  name        = "${local.name_prefix}PRISUB${local.environment}"
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.subnet_type
  cidr        = var.subnet_cidrs["k8s"]
  description = "k8s Subnet"
  tags        = local.common_tags
  # depends_on  = [time_sleep.wait_after_vpc]
#   depends_on  = [samsungcloudplatform_internet_gateway.my_igw]
}

# 데이터베이스를 위한 프라이빗 서브넷
resource "samsungcloudplatformv2_vpc_subnet" "db_subnet" {
  name        = "${local.name_prefix}DBSUB${local.environment}"
  vpc_id      = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  type        = var.subnet_type
  cidr        = var.subnet_cidrs["db"]
  description = "DB Subnet"
  tags        = local.common_tags
  # depends_on  = [time_sleep.wait_after_vpc]
#   depends_on  = [samsungcloudplatform_internet_gateway.my_igw]
}