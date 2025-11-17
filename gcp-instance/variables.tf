variable "network" {
  description = "The self_link of the VPC network to attach the VM to."
  type        = string
}
variable "os_family" {
  description = "The OS image family to use for the VM boot disk"
  type        = string
}
variable "image_project_id" {
  description = "GCP project ID for public image lookup (e.g., debian-cloud)."
  type        = string
}
variable "instance_name" {
  type        = string
  description = "Name of the VM instance."
}

variable "machine_type" {
  type        = string
  description = "GCE machine type."
  default     = "e2-micro"
}


variable "zone" {
  type        = string
  description = "GCP zone"
}

variable "subnetwork" {
  description = "The self_link of the subnetwork to attach the VM to."
  type        = string
}