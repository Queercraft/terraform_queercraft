# Terraform
This repository contains [Terraform](https://www.terraform.io/) code used for [Queercraft](https://www.queercraft.net/)'s infrastructure. Currently we only use Terraform to manage our DNS records. We use [Cloudflare](https://www.cloudflare.com/) for DNS.

You might also want to check out the [Terraform](https://www.terraform.io/) repository for the server, which can be found [here](
https://github.com/Queercraft/terraform_queercraft)

## Contents
Projects:
Project | Description
--- | ---
[dns](projects/dns) | Terraform code for managing Queercraft's DNS records

## Usage

### DNS
Enter the `projects/dns` directory and run `terraform init` to initialize the Terraform project. Then run `terraform apply` to apply the changes. You will be prompted to enter your Cloudflare API token and the Cloudflare zone ID.  
If you don't know it, you likely shouldn't be using this repository :).  

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
