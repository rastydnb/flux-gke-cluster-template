# This will construct a VPC-native, private GKE cluster. For effective routing from the Regional External HTTP Load Balancer,
# having the VPC-native cluster is needed to make Gloo Edge's Envoy gateway-proxy pods routable via a standalone NEG.
# See links in the comments below for specifics. This page is a good place to understand the overall solution:
# https://cloud.google.com/kubernetes-engine/docs/how-to/standalone-neg

provider "google" {
  # Run 'gcloud auth application-default login' to get credentials.json
  # credentials = "${file("credentials.json")}"
  project     = var.project_id
  region      = var.region
}
resource "google_container_cluster" "default" {
  provider = google-beta
  project  = var.project_id
  name     = var.gke_cluster_name
  location = var.zone
  initial_node_count = var.num_nodes
  # More info on the VPC native cluster: https://cloud.google.com/kubernetes-engine/docs/how-to/standalone-neg#create_a-native_cluster
  networking_mode = "VPC_NATIVE"
  network    = google_compute_network.default.name
  subnetwork = google_compute_subnetwork.default.name
  # Disable the Google Cloud Logging service because you may overrun the Logging free tier allocation, and it may be expensive
  logging_service = "none"
  # On version 5.0.0+ of the provider, you must explicitly set deletion_protection=false (and run terraform apply to write the field to state) in order to destroy a cluster.
  deletion_protection = false

  # Enable Workload Identity
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  node_config {
    # More info on Spot VMs with GKE https://cloud.google.com/kubernetes-engine/docs/how-to/spot-vms#create_a_cluster_with_enabled
    spot = true
    machine_type = var.machine_type
    disk_size_gb = var.disk_size
    tags = ["${var.gke_cluster_name}"]
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/servicecontrol",
    ]
    taint {
      key    = "node.cilium.io/agent-not-ready"
      value  = "true"
      effect = "NO_EXECUTE"
    }
  }

  addons_config {
    http_load_balancing {
      # This needs to be enabled for the NEG to be automatically created for the ingress gateway svc
      disabled = false
    }
  }

  private_cluster_config {
    # Need to use private nodes for VPC-native GKE clusters
    enable_private_nodes = true
    # Allow private cluster Master to be accessible outside of the network
    enable_private_endpoint = false
    master_ipv4_cidr_block = "172.16.0.16/28"
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block = "5.0.0.0/16"
    services_ipv4_cidr_block = "5.1.0.0/16"
  }

  default_snat_status {
    # More info on why sNAT needs to be disabled: https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips#enable_pupis
    # This applies to VPC-native GKE clusters
    disabled = true
  }

  master_authorized_networks_config {
    cidr_blocks {
      # Because this is a private cluster, need to open access to the Master nodes in order to connect with kubectl
      cidr_block = "0.0.0.0/0"
      display_name = "World"
    }
  }
}

data "google_client_config" "default" {
  depends_on = [google_container_cluster.default]
}

locals {
  kubeconfig_content = templatefile("../bootstrap/kubeconfig.tpl", {
    name                    = var.gke_cluster_name,
    endpoint                = "https://${google_container_cluster.default.endpoint}",
    cluster_ca_certificate = google_container_cluster.default.master_auth[0].cluster_ca_certificate,
    access_token           = data.google_client_config.default.access_token
  })
}

resource "local_file" "kubeconfig" {
  content  = local.kubeconfig_content
  filename = "../kubeconfig"
}

module "bootstrap_infra" {
  depends_on = [ local_file.kubeconfig ]
  source = "./modules/bootstrap_infra"
  project_id  = var.project_id
}
