resource "google_storage_bucket" "bucket" {
  name     = "test-bucket-raja-project-1234"
  location = "europe-west2"
}

resource "google_storage_bucket" "gcs_bucket" {
  name     = "test-bucket-raja-project-5678"
  location = "europe-west2"
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}


resource "google_compute_instance" "vm_instance" {
  name         = "rajasekaran-tf-vm-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}