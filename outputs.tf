output "vpc_output" {
  value = samsungcloudplatformv2_vpc_vpc.my_vpc
}

output "my_current_public_ip" {
  value = chomp(data.http.my_public_ip.response_body)
}