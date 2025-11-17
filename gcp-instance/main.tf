data "google_compute_image" "default" {
  family  = var.os_family
  project = var.image_project_id
}

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.default.self_link
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork
  }

  metadata = {
    startup-script = file("${path.module}/scripts/startup-script.sh")
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  labels = {
    managed_by = "terraform"
  }
}
