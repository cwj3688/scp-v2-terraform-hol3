# # 쿠버네티스 엔진 리소스 생성
# resource "samsungcloudplatform_kubernetes_engine" "k8s_engine" {
#   name               = "${local.name_prefix}k8s${local.environment}"
#   kubernetes_version = "v1.30.6"

#   vpc_id            = samsungcloudplatform_vpc.my_vpc.id
#   subnet_id         = samsungcloudplatform_subnet.k8s_subnet.id
#   security_group_id = samsungcloudplatform_security_group.k8s_sg.id
#   volume_id         = samsungcloudplatform_file_storage.k8s_file_storage.id

#   cloud_logging_enabled = false
#   public_acl_ip_address = "${local.my_current_ip_address}"

#   load_balancer_id      = samsungcloudplatform_load_balancer.my_lb.id
# }

# # 쿠버네티스 kubeconfig 데이터 소스
# data "samsungcloudplatform_kubernetes_kubeconfig" "kubeconfig" {
#   kubernetes_engine_id = samsungcloudplatform_kubernetes_engine.k8s_engine.id
#   kubeconfig_type = "public"
# }


# # local_file 리소스를 사용하여 kubeconfig 파일 생성
# resource "local_file" "kubeconfig" {
#   content  = data.samsungcloudplatform_kubernetes_kubeconfig.kubeconfig.kube_config
#   filename = pathexpand("~/.kube/config") # 저장될 파일 경로 및 이름

#   # 파일 권한 설정 (선택 사항, Linux/macOS)
#   file_permission = "0600" # 소유자만 읽기/쓰기 가능
# }

#--------------------------------


resource "samsungcloudplatformv2_ske_cluster" "my_cluster" {
  cloud_logging_enabled = false
  kubernetes_version = "v1.31.8"
  name = "${local.name_prefix}k8s${local.environment}"
  security_group_id_list = [samsungcloudplatformv2_security_group_security_group.k8s_sg.id]
  subnet_id = samsungcloudplatformv2_vpc_subnet.k8s_subnet.id
  vpc_id = samsungcloudplatformv2_vpc_vpc.my_vpc.id
  volume_id = samsungcloudplatformv2_filestorage_volume.k8s_file_storage.id
  public_endpoint_access_control_ip = "${local.my_current_ip_address}"
}

# data "samsungcloudplatformv2_ske_cluster_kubeconfig" "cluster_kubeconfig" {
#     cluster_id = samsungcloudplatformv2_ske_cluster.my_cluster.id
#     kubeconfig_type = "private"
# }

# output "cluster_kubeconfig" {
#   value = data.samsungcloudplatformv2_ske_cluster_kubeconfig.cluster_kubeconfig.kubeconfig
# }

# resource "local_file" "kubeconfig" {
#   content  = data.samsungcloudplatformv2_ske_cluster_kubeconfig.cluster_kubeconfig.kubeconfig
#   filename = pathexpand("~/.kube/config") # 저장될 파일 경로 및 이름

#   # 파일 권한 설정 (선택 사항, Linux/macOS)
#   file_permission = "0600" # 소유자만 읽기/쓰기 가능
# }