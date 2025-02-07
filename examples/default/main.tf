module "gitlab_project_membership" {
  source = "../.."

  project      = data.gitlab_project.this.id
  user_id      = data.gitlab_user.this.user_id
  access_level = "owner"
}
