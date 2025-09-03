# SCP v2 Terraform Project

## 개요

Samsung Cloud Platform (SCP) v2 환경의 인프라를 Terraform을 사용하여 생성하고 관리하는 프로젝트입니다.
본 Terraform 코드는 VPC, Subnet, Kubernetes 클러스터 및 기타 네트워크 리소스를 포함한 전체 인프라를 코드로써 관리(IaC)하는 것을 목표로 합니다.

## 사전 요구사항

*   Terraform v1.1.11 이상
*   Go v1.22.5 (프로바이더 빌드 시 필요)
*   SCP 계정 및 API 접근 키

## 자격 증명 설정

Terraform이 SCP API와 통신하려면 자격 증명 정보가 필요합니다.

1.  **`.scpconf` 디렉토리 생성**
    사용자 홈 디렉토리에 `.scpconf` 디렉토리를 생성합니다.
    ```bash
    # Windows의 경우
    cd %USERPROFILE%
    mkdir ".scpconf"

    # Linux/macOS의 경우
    cd ~
    mkdir ".scpconf"
    ```

2.  **`config.json` 파일 생성 (`~/.scpconf/config.json`)**
    SCP 접속 정보를 설정합니다.
    ```json
    {
        "auth-url": "https://iam.e.samsungsdscloud.com/v1",
        "default-region": "kr-west1"
    }
    ```

3.  **`credentials.json` 파일 생성 (`~/.scpconf/credentials.json`)**
    API 인증을 위한 Access Key와 Secret Key를 설정합니다.
    ```json
    {
        "access-key": "xxxxxxxxxxxxxx",
        "secret-key": "xxxxxxxxxxxxxx"
    }
    ```

## 프로바이더 설정 (Provider Configuration)

본 프로젝트는 `samsungsdscloud/samsungcloudplatformv2` 프로바이더를 사용합니다.
`provider.tf` 파일에 다음과 같이 프로바이더 정보가 설정되어 있습니다.

```terraform
terraform {
  required_providers {
    samsungcloudplatformv2 = {
      version = "1.0.3"
      source  = "samsungsdscloud/samsungcloudplatformv2"
    }
  }
  required_version = ">= 1.11"
}

provider "samsungcloudplatformv2" {
  # 자격 증명 파일 (~/.scpconf/...) 또는 환경 변수를 사용하므로
  # provider 블록은 비워둡니다.
}
```

### 프로바이더 인수 (Provider Arguments)

프로바이더에 `auth_url`, `access_key` 등의 인수를 직접 전달할 수도 있지만, 이 프로젝트에서는 보안을 위해 자격 증명 파일이나 환경 변수를 통해 설정하는 것을 권장합니다.

| 인수           | 설명                 | 환경 변수               |
| -------------- | -------------------- | ----------------------- |
| `auth_url`       | SCP API 인증 URL     | `SCP_TF_AUTH_URL`       |
| `default_region` | 기본 리전            | `SCP_TF_DEFAULT_REGION` |
| `access_key`     | SCP API Access Key   | `SCP_TF_ACCESS_KEY`     |
| `secret_key`     | SCP API Secret Key   | `SCP_TF_SECRET_KEY`     |

### 리소스 생성 예시

다음은 가상 서버(VM) 인스턴스를 생성하는 리소스 예시입니다.

```terraform
// 가상 서버 인스턴스 생성
resource "samsungcloudplatformv2_virtualserver_server" "server" {
  name           = var.name
  state          = var.state
  image_id       = var.image_id
  server_type_id = var.server_type_id
  # ...
}
```


## 프로젝트 구조

```
.
├── provider.tf             # 프로바이더 및 Terraform 버전 설정
├── variables.tf            # 변수 정의
├── main.tf                 # 공통 리소스 및 모듈 호출
# ... (기타 .tf 파일)
```

## 사용 방법

1.  **Terraform 초기화**
    ```bash
    terraform init
    ```

2.  **실행 계획 검토**
    ```bash
    terraform plan
    ```

3.  **인프라 생성 및 변경**
    ```bash
    terraform apply
    ```

4.  **인프라 삭제**
    ```bash
    terraform destroy
    ```

## 주의사항

*   본 코드는 실제 운영 환경에 적용하기 전, 충분한 검토와 테스트가 필요합니다.
*   Terraform 상태 파일(`.tfstate`)은 보안을 위해 원격 백엔드(Remote Backend)에 저장하는 것을 권장합니다.
*   `terraform destroy` 실행 시 모든 리소스가 영구적으로 삭제되므로 주의하시기 바랍니다.
