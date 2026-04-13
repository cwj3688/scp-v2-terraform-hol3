# [Outputs] 테라폼 적용 후 화면에 출력될 주요 리소스 정보

# 생성된 VPC 상세 정보 출력
output "vpc_output" {
  value = samsungcloudplatformv2_vpc_vpc.my_vpc
}

# 생성된 서브넷 ID 목록 출력 (용도별 참조용)
output "subnet_ids" {
  value = {
    lb  = samsungcloudplatformv2_vpc_subnet.lb_subnet.id
    k8s = samsungcloudplatformv2_vpc_subnet.k8s_subnet.id
    db  = samsungcloudplatformv2_vpc_subnet.db_subnet.id
  }
}

# SKE 클러스터 상세 정보 출력
output "ske_cluster" {
  value = samsungcloudplatformv2_ske_cluster.my_cluster
}

# 조회된 현재 작업자의 공인 IP 출력
output "my_current_public_ip" {
  value = chomp(data.http.my_public_ip.response_body)
}