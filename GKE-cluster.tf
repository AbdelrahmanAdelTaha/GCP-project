resource "google_container_cluster" "private-cluster" {
  name                     = "private-cluster"
  location                 = "us-central1-c"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.project-vpc.id
  subnetwork               = google_compute_subnetwork.restricted-subnet.id

  node_locations = [
    "us-central1-b"
  ]

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = "10.0.0.0/24"
      display_name = "managment-subnet-network"
    }
  }

  ip_allocation_policy {

  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  cluster    = google_container_cluster.private-cluster.id
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.nodes-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
