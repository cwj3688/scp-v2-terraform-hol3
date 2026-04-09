# 파일 스토리지 (File Storage) - NFS 프로토콜을 사용하는 공유 스토리지 볼륨
resource "samsungcloudplatformv2_filestorage_volume" "k8s_file_storage" {
  name = "${local.name_prefix}fs${local.environment}"
  protocol = "NFS"
  type_name = "HDD"

  # access_rules를 빈 리스트로 명시적으로 설정합니다. (에러 대응)
  access_rules = [] 

  tags = local.common_tags
}