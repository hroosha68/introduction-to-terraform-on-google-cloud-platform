module "app-network" {
  source  = "terraform-google-modules/network/google"
  version = "18.2.0"

  network_name = "${var.network_name}-network"
  project_id   = var.project_id

  subnets = [
    {
      subnet_name   = "${var.network_name}-subnet0"
      subnet_ip     = var.network_ip_range
      subnet_region = var.region
    }
  ]

  ingress_rules = [
    {
      name          = "${var.network_name}-web"
      description   = "Inbound web traffic"
      source_ranges = ["0.0.0.0/0"]
      target_tags   = ["${var.network_name}-web"]


      allow = [
        {
          protocol = "tcp"
          ports    = ["80", "443"]
        }
      ]

    }
  ]
}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = var.project_image
  family      = var.image_family
}

resource "google_compute_instance" "blog" {
  name         = var.app_name
  machine_type = var.machine_type
  tags         = ["${var.network_name}-web"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }

  network_interface {
    subnetwork = module.app-network.subnets_names[0]
    access_config {
      # Leave empty for dynamic public IP
    }
  }
  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -eux
    apt update
    apt install -y nginx
    echo "<h1>Welcome to ${var.app_name}!</h1>" > /var/www/html/index.html
    systemctl start nginx
    systemctl enable nginx
  EOT

}