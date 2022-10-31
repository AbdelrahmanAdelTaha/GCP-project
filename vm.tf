resource "google_compute_instance" "private-vm" {
  name                      = "private-vm"
  machine_type              = "e2-medium"
  zone                      = "us-central1-a"
  allow_stopping_for_update = true

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
      size  = "10"
    }
  }

  network_interface {
    network    = google_compute_network.project-vpc.id
    subnetwork = google_compute_subnetwork.management-subnet.id
  }

  service_account {
    email  = google_service_account.vm-service-account.email
    scopes = ["cloud-platform"]
  }
}
