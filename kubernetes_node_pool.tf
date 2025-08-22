# # 쿠버네티스 노드용 Ubuntu 이미지 데이터 소스
# data "samsungcloudplatform_standard_image" "k8s_ubuntu_image" {
#   service_group = "CONTAINER"
#   service       = "Kubernetes Engine VM"
#   region        = data.samsungcloudplatform_region.my_region.location

#   # 특정 버전의 Ubuntu 이미지 필터링
#   filter {
#     name      = "image_name"
#     values    = ["Ubuntu 22.04 (Kubernetes)-v1.30.6"]
#     use_regex = false
#   }
# }

# # 쿠버네티스 워커 노드 풀 구성
# resource "samsungcloudplatform_kubernetes_node_pool" "k8s_pool" {
#   name           = "${local.name_prefix}nodepool${local.environment}"
#   engine_id      = samsungcloudplatform_kubernetes_engine.k8s_engine.id
#   image_id       = data.samsungcloudplatform_standard_image.k8s_ubuntu_image.id
#   auto_scale     = true                     # 자동 스케일링 활성화
#   min_node_count = 1                        # 최소 노드 수
#   max_node_count = 3                        # 최대 노드 수
#   auto_recovery  = false                    # 자동 복구 비활성화
# }


resource "samsungcloudplatformv2_ske_nodepool" "nodepool" {
  name = "${local.name_prefix}nodepool${local.environment}"
  cluster_id = samsungcloudplatformv2_ske_cluster.my_cluster.id
  image_os = "ubuntu"
  image_os_version = "22.04"
  is_auto_recovery = false
  is_auto_scale = true
  min_node_count = 1
  max_node_count = 3
  desired_node_count = 1
  keypair_name = samsungcloudplatformv2_virtualserver_keypair.keypair.name
  kubernetes_version = "v1.31.8"
  server_type_id = "s1v2m4"
  volume_type_name = "SSD"
  volume_size = "104"
}