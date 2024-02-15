
project_id       = "home-gke"
region           = "us-west4"
zone             = "us-west4-a"
gke_cluster_name = "monitorwombat"
num_nodes        = 3
machine_type     = "e2-standard-2"
disk_size        = 20
network_name     = "monitorwombat-network"
ip_address_name  = "monitorwombat-static-ip"
ssl_cert_name    = "ninjawombat-ssl-cert"
ssl_cert_crt     = "certs/self-signed.crt"
ssl_cert_key     = "certs/self-signed.key"

# Change to true to enable HTTPS and HTTP redirect for the load balancer
https            = true
load_balancer    = false

secrets_map = [
    {
      name               = "demo-password-1"
      autogenerate       = true
      chars_count        = 24
      use_special_charts = false
    }
  ]
