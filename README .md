# Terraform GCP Instance Module

This repository contains a Terraform module for deploying a Google Cloud Platform (GCP) Compute Engine instance. The module is designed to be reusable and customizable for various GCP projects and supports Rocky Linux images.

## Structure

- `main.tf`: Main configuration file for the root module.
- `providers.tf`: Specifies the required providers (GCP).
- `terraform.tfvars`: Contains variable values for the deployment.
- `variables.tf`: Declares input variables for the root module.
- `versions.tf`: Specifies required Terraform and provider versions.
- `module/gcp-instance/`: Contains the reusable GCP instance module.
  - `main.tf`: Logic for creating the GCP instance resource.
  - `variables.tf`: Input variables for the instance module.
  - `scripts/startup-script.sh`: Startup script executed on instance creation.

## Usage

1. **Configure Providers**

   - Edit `providers.tf` to set up your GCP credentials and project information. Use the variable `gcp_project_id` for your deployment project.

2. **Set Variables**

   - Update `terraform.tfvars` with your desired values (e.g., `gcp_project_id`, `region`, `zone`, `instance_name`, `machine_type`, `network`, `subnetwork`).
   - For Rocky Linux, set:

     ```hcl
     image_family     = "rocky-linux-9"
     image_project_id = "rocky-linux-cloud"
     ```

3. **Customize the Module**
   - The `module/gcp-instance` directory contains the logic for creating a Compute Engine instance. You can modify `main.tf` and `variables.tf` to fit your requirements.
   - The `scripts/startup-script.sh` can be customized to run commands on instance startup (e.g., hostname setup, Puppet config, user creation via metadata).

4. **Initialize and Apply**

   ```sh
   terraform init
   terraform plan
   terraform apply
   ```

## Example

```hcl
module "vm" {
  source            = "./module/gcp-instance"
  instance_name     = "example-instance"
  machine_type      = "e2-medium"
  zone              = "us-central1-a"
  gcp_project_id    = "your-gcp-project-id"
  image_family      = "rocky-linux-9"
  image_project_id  = "rocky-linux-cloud"
  network           = "your-vpc-network"
  subnetwork        = "your-subnetwork"
}
```

## Requirements

- Terraform >= 1.0.0
- GCP credentials with sufficient permissions

## License

MIT
