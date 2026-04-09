# [Outputs] 테라폼 적용 후 화면에 출력될 주요 리소스 정보

# 생성된 VPC 상세 정보 출력
output "vpc_output" {
  value = samsungcloudplatformv2_vpc_vpc.my_vpc
}

# 조회된 현재 작업자의 공인 IP 출력
output "my_current_public_ip" {
  value = chomp(data.http.my_public_ip.response_body)
}