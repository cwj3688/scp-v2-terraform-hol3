# # 파일 스토리지 - 쿠버네티스 영구 볼륨용
# resource "samsungcloudplatform_file_storage" "k8s_file_storage" {
#   file_storage_name     = "${local.name_prefix}fs${local.environment}"
#   disk_type            = "HDD"
#   file_storage_protocol = "NFS"
#   product_names        = ["HDD"]
#   service_zone_id      = data.samsungcloudplatform_project.my_scp_project.default_zone_id
#   tags                 = local.common_tags
# }


resource "samsungcloudplatformv2_filestorage_volume" "k8s_file_storage" {
  name = "${local.name_prefix}fs${local.environment}"
  protocol = "NFS"
  type_name = "HDD"

  # access_rules를 빈 리스트로 명시적으로 설정합니다. (에러 대응)
  access_rules = [] 

  tags = local.common_tags
}