# terraform-resource-two-regions

This repo contains will create an aws vpc in 2 regions: eu-west-1 and eu-west-2.

# Theory
A resource can be deployed in two regions by loading a provider and provide two sets of configurations.
To distinguish between providers the alias argument can be used.

```
# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "eu-west-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`.
provider "aws" {
  region = "eu-west-2"
  alias  = "west2"
}
```
For details on how to configure proviers follow this [LINK](https://www.terraform.io/docs/language/providers/configuration.html)

When declaring the resource specify which providers these resources should be associated to:
```
resource "aws_vpc" "vpc-eu-west1" {
  cidr_block       = "10.202.0.0/16"
  # provider argument can be omitted as it's referencing the default provider (one without alias)
    provider = aws
  tags = {
    Name = "web-proj-west-1"
  }
}

resource "aws_vpc" "vpc-eu-west2" {
  cidr_block       = "10.202.0.0/16"
    provider = aws.west2

  tags = {
    Name = "web-proj-west-2"
  }
}
```


# How to use this repo

It is assumed that credentials/API keys to manage AWS are configured for your environment.
For more details check this [LINK](https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1)

Download the repository
```
git clone git@github.com:ion-training/terraform-resource-two-regions.git
```

cd into the new repo
```
cd terraform-resource-two-regions
```

Terraform init and terraform apply -auto-approve.
_for brevity -auto-approve was used

```
terraform init && terraform apply -auto-approve
```

# Sample output
```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching "3.63.0"...
- Installing hashicorp/aws v3.63.0...
- Installed hashicorp/aws v3.63.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```
$ terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.vpc-eu-west1 will be created
  + resource "aws_vpc" "vpc-eu-west1" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.202.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "ion-web-proj"
        }
      + tags_all                         = {
          + "Name" = "ion-web-proj"
        }
    }

  # aws_vpc.vpc-eu-west2 will be created
  + resource "aws_vpc" "vpc-eu-west2" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.202.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "ion-web-proj"
        }
      + tags_all                         = {
          + "Name" = "ion-web-proj"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
aws_vpc.vpc-eu-west2: Creating...
aws_vpc.vpc-eu-west1: Creating...
aws_vpc.vpc-eu-west2: Creation complete after 2s [id=vpc-01afb157be0a0856f]
aws_vpc.vpc-eu-west1: Creation complete after 3s [id=vpc-0ff960b8c9c833405]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

```
terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.vpc-eu-west1 will be created
  + resource "aws_vpc" "vpc-eu-west1" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.202.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "ion-web-proj"
        }
      + tags_all                         = {
          + "Name" = "ion-web-proj"
        }
    }

  # aws_vpc.vpc-eu-west2 will be created
  + resource "aws_vpc" "vpc-eu-west2" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.202.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "Name" = "ion-web-proj"
        }
      + tags_all                         = {
          + "Name" = "ion-web-proj"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
aws_vpc.vpc-eu-west2: Creating...
aws_vpc.vpc-eu-west1: Creating...
aws_vpc.vpc-eu-west2: Creation complete after 2s [id=vpc-01afb157be0a0856f]
aws_vpc.vpc-eu-west1: Creation complete after 3s [id=vpc-0ff960b8c9c833405]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```