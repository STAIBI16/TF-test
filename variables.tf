
variable "image_family" {
  description = "The image family to use for the VM boot disk."
  type        = string
  default     = "rocky-linux-8"  # Example default value
}

variable "gcp_project_id" {
  type        = string
  description = "GCP project ID where resources are deployed."
}

variable "region" {
  type        = string
  description = "GCP region."
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  description = "GCP zone"
  default     = "europe-west1-b"
}

variable "instance_name" {
  type        = string
  description = "Name for the VM instance."
  default     = "tf-test-vm"
}

variable "machine_type" {
  type        = string
  description = "machine type."
  default     = "e2-micro"
}

variable "image_project_id" {
  description = "GCP project ID for public image lookup."
  type        = string
  default     = "rocky-linux-cloud"  # Example default value
}

variable "network" {
  description = "The self_link of the VPC network to attach the VM to."
  type        = string
  
}

variable "subnetwork" {
  description = "The self_link of the subnetwork to attach the VM to."
  type        = string
}
