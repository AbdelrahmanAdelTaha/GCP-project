resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  region        = "us-central1"
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.project-vpc.id
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name                     = "restricted-subnet"
  region                   = "us-central1"
  ip_cidr_range            = "10.0.1.0/24"
  network                  = google_compute_network.project-vpc.id
  private_ip_google_access = true
}
