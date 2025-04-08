variable "access_level" {
  type        = string
  description = "The access level for the member"

  validation {
    condition     = contains(["no one", "minimal", "guest", "reporter", "developer", "maintainer", "owner"], var.access_level)
    error_message = "Valid values are no one, minimal, guest, reporter, developer, maintainer, owner"
  }
}

variable "project" {
  type        = string
  description = "The ID or URL-encoded path of the project"
}

variable "user_id" {
  type        = number
  description = "The id of the user"
}

variable "expires_at" {
  type        = string
  default     = null
  description = "Expiration date for the project membership"
}

variable "member_role_id" {
  type        = number
  default     = null
  description = "The ID of a custom member role"
}
