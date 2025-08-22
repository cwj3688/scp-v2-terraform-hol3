# SCP Terraform HOL3 프로젝트

Samsung Cloud Platform(SCP)에서 Terraform을 사용하여 쿠버네티스 인프라를 구축하는 HOL3 실습 프로젝트입니다.

## 사전 요구사항

- Terraform v0.13 이상
- SCP 계정 및 액세스 키
- 필요한 프로바이더:
  - SamsungSDSCloud/samsungcloudplatform v3.8.1
  - hashicorp/time v0.13.0
  - hashicorp/http v3.4.5
  - hashicorp/local v2.5.2

## 자격 증명 설정

1. `.scp` 디렉토리 생성
```bash
mkdir "~/.scp"
```
2. config.json 파일 생성 : `~/.scp/config.json`
```
{
    "host": "https://openapi.samsungsdscloud.com",
    "user-id": "1234",
    "email": "your.email@samsung.com",
    "project-id": "PROJECT-XXXXXXXXXXXXXXXX"
}
```
3. credentials.json 파일 생성 : `~.scp/credentials.json`
```
{
    "auth-method": "access-key",
    "access-key": "XXXXXXXXXXXXXXXX",
    "secret-key": "XXXXXXXXXXXXXXXX"
}
```

## 프로젝트 구조
```
scp-terraform-hol3/
├── provider.tf         # 프로바이더 설정
├── variables.tf        # 변수 정의
├── main.tf            # 메인 설정 및 공통 리소스
├── outputs.tf         # 출력 변수 정의
├── vpc.tf             # VPC 리소스
├── subnets.tf         # 서브넷 리소스
├── natgateway.tf      # NAT 게이트웨이 리소스
├── internetgateway.tf # 인터넷 게이트웨이 리소스
├── securitygroup.tf   # 보안 그룹 설정
├── firewall.tf        # 방화벽 규칙
├── loadbalancer.tf    # 로드밸런서 리소스
├── kubernetes_engine.tf # 쿠버네티스 엔진 설정
├── kubernetes_node_pool.tf # 쿠버네티스 노드 풀 설정
└── filestorage.tf     # 파일 스토리지 설정
```

## 주요 기능
- VPC 및 서브넷 구성
  - 퍼블릭 서브넷 (배스천 호스트용)
  - 프라이빗 서브넷 (쿠버네티스용)
  - 프라이빗 서브넷 (데이터베이스용)

- 네트워크 구성
  - 인터넷 게이트웨이
  - NAT 게이트웨이
  - 방화벽 규칙

- 쿠버네티스 클러스터  
  - 쿠버네티스 엔진 (v1.30.6)
  - 자동 스케일링 노드 풀
  - 로드밸런서 통합
  - NFS 파일 스토리지

## 시작하기
1. 저장소 클론
```
git clone <repository-url>
cd scp-terraform-hol3
```
2. Terraform 초기화
```
terraform init
```
3. 실행 계획 확인
```
terraform plan
```
4. 인프라 배포
```
terraform apply
```
5. kubeconfig 설정
- 배포가 완료되면 자동으로 kubeconfig가 생성됩니다.
- 생성된 kubeconfig를 사용하여 클러스터에 접근할 수 있습니다.
## 리소스 정리
프로젝트의 모든 리소스를 삭제하려면:
```
terraform destroy
``` 

## 주의사항
- 모든 리소스 이름은 환경 변수와 접두사를 통해 자동 생성됩니다.
- 보안 그룹과 방화벽 규칙을 신중히 검토하세요.
- 프로젝트 삭제 시 모든 데이터가 영구적으로 삭제됩니다.
- 실제 운영 환경에서는 상태 파일을 원격 저장소에 저장하는 것을 권장합니다.
- 이 프로젝트는 HOL3 실습용으로 설계되었으며, 실제 운영 환경에 사용하기 전에 검토 및 테스트가 필요합니다.
