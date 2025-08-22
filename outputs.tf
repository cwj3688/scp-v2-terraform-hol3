# output "my_scp_project_id" {
#   value = data.samsungcloudplatform_project.my_scp_project.id
# }

# output "my_scp_project_service_zone_id" {
#   value = data.samsungcloudplatform_project.my_scp_project.default_zone_id
# }

# output "my_region" {
#     value = data.samsungcloudplatform_region.my_region.location
# }

output "vpc_output" {
  value = samsungcloudplatformv2_vpc_vpc.my_vpc
}

# output "cluster_output" {
#   value = samsungcloudplatformv2_ske_cluster.my_cluster
# }

# output "my_igw_fw_id" {
#   value = samsungcloudplatform_firewall.my_igw_fw.id
# }

output "my_current_public_ip" {
  value = chomp(data.http.my_public_ip.response_body)
}

# output "my_lb_id" {
#   value = samsungcloudplatform_load_balancer.my_lb.id
# }

# output "my_lb_link_ip" {
#   value = samsungcloudplatform_load_balancer.my_lb.link_ip
# }

# output "file_storage_id" {
#   value = samsungcloudplatform_file_storage.k8s_file_storage.id
# }

# output "kubernetes_engine_id" {
#   value = samsungcloudplatform_kubernetes_engine.k8s_engine.id
# }

# output "kubernetes_engine_kubeconfig" {
#   value = data.samsungcloudplatform_kubernetes_kubeconfig.kubeconfig.kube_config
#   sensitive   = true
# }

# output "kubernetes_engine_public_endpoint" {
#   value = samsungcloudplatform_kubernetes_engine.k8s_engine.public_endpoint
# }