resource "google_compute_network" "project-vpc" {
  name                            = "project-vpc"
  auto_create_subnetworks         = false
  routing_mode                    = "GLOBAL"
  delete_default_routes_on_create = false
}
