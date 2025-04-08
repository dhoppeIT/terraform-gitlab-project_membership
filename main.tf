resource "gitlab_project_membership" "this" {
  project      = var.project
  user_id      = var.user_id
  access_level = var.access_level

  expires_at     = var.expires_at
  member_role_id = var.member_role_id
}
