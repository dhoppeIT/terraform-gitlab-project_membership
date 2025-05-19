# terraform-gitlab-project_membership

Terraform module to manage the following Twingate resources:

* gitlab_project_membership

## Usage

Copy and paste the following code snippet to your Terraform configuration,
specify the required variables and run the command `terraform init`.

```hcl
module "gitlab_group" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-group/local"
  version = "1.1.4"

  name = "Example (group)"
  path = "example-group-48165"
}

module "gitlab_project" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-project/local"
  version = "1.1.5"

  name = "example-project"

  description  = "Example (project)"
  namespace_id = module.gitlab_group.id
}

module "gitlab_user" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-user/local"
  version = "1.2.0"

  name     = "John Doe"
  username = "jdoe"
  password = "XKvhCJp9MtwTgwRu" # gitleaks:allow
  email    = "john.doe@example.com"
}

module "gitlab_project_membership" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-project-membership/local"
  version = "1.1.0"

  project      = module.gitlab_project.id
  user_id      = module.gitlab_user.id
  access_level = "owner"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~> 18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | ~> 18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_project_membership.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_level"></a> [access\_level](#input\_access\_level) | The access level for the member | `string` | n/a | yes |
| <a name="input_expires_at"></a> [expires\_at](#input\_expires\_at) | Expiration date for the project membership | `string` | `null` | no |
| <a name="input_member_role_id"></a> [member\_role\_id](#input\_member\_role\_id) | The ID of a custom member role | `number` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID or URL-encoded path of the project | `string` | n/a | yes |
| <a name="input_user_id"></a> [user\_id](#input\_user\_id) | The id of the user | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [Dennis Hoppe](https://gitlab.com/dhoppeIT).

## License

Apache 2 licensed. See [LICENSE](LICENSE) for full details.
