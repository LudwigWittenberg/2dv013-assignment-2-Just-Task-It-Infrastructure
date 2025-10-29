output "cluster_ip_addresses" {
  description = "The IP addresses of the clusters"
  value = {
    for cluster in google_container_cluster.default : cluster.name => cluster.ip_address
  }
}