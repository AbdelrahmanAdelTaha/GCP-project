resource "google_compute_router" "project-router" {
  name    = "project-router"
  region  = google_compute_subnetwork.management-subnet.region
  network = google_compute_network.project-vpc.id
}

resource "google_compute_router_nat" "project-nat" {
  name                               = "project-nat"
  router                             = google_compute_router.project-router.name
  region                             = google_compute_router.project-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.management-subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

}
