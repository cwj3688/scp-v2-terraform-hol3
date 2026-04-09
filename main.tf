# [Locals] 프로젝트 전반에서 재사용되는 변수 및 상수 그룹 정의
# 프로젝트 메타데이터 설정
locals {
  # 프로젝트 이름 정의
  project     = "scp-terraform-hol3"
  # 환경 구분 정의
  environment = "hol3"
  # 리전 정보
  
  # 공통 태그 정의
  common_tags = {
    Project     = local.project
    Environment = local.environment
    ManagedBy   = "Terraform"
  }

  # 리소스 이름 접두사 정의
  name_prefix = "tf"
}

# [Data Source] 현재 작업자의 공인 IP 주소 자동 조회
# 현재 IP 주소 조회 데이터 소스
data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

# 현재 IP 주소 변수 정의
locals {
  my_current_ip_address = chomp(data.http.my_public_ip.response_body)
}
