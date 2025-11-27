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