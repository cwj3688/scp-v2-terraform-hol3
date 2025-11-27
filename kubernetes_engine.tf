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