resource "samsungcloudplatformv2_virtualserver_keypair" "keypair" {
  name = "${local.name_prefix}-keypair-${local.environment}"
  tags = local.common_tags
}

output "keypair_output" {
  value = samsungcloudplatformv2_virtualserver_keypair.keypair
}

resource "local_file" "my_keypair" {
  content  = samsungcloudplatformv2_virtualserver_keypair.keypair.private_key
  filename = pathexpand("./mykey.pem") # 저장될 파일 경로 및 이름

  # 파일 권한 설정 (선택 사항, Linux/macOS)
  file_permission = "0600" # 소유자만 읽기/쓰기 가능
}