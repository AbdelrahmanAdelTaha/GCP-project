resource "google_compute_firewall" "firewall-allow-ssh" {
  name    = "firewall-allow-ssh"
  network = google_compute_network.project-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
