data "gitlab_project" "this" {
  path_with_namespace = "example-group-48165/example-project"
}

data "gitlab_user" "this" {
  username = "dhoppeIT"
}
