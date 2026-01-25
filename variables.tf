variable "app" {
  type        = string
  description = "Application"
  default     = "ecr"
}
variable "buildmethod" {
  type        = string
  description = "IaC used"
  default     = "terraform"
}
variable "encryption_configuration" {
  type = object({
    encryption_type = string
    kms_key         = any
  })
  description = "ECR encryption configuration. If not set, will use encryption_type variable."
  default     = null
}
variable "env" {
  type    = string
  default = ""
}

variable "encryption_type" {
  type        = string
  description = "Type of encryption for the repository"
  default     = "AES256"
}

variable "external_accounts_policy" {
  type        = bool
  description = "Set to true and added accounts to principals_pull_access"
  default     = false
}
variable "force_delete" {
  type        = bool
  default     = true
  description = "will delete the repository even if it contains images, set to false to disable"
}
variable "image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the repository. Valid values are 'MUTABLE' and 'IMMUTABLE'."
  default     = "IMMUTABLE"

}
variable "life_cycle_policy_days" {
  type        = number
  description = "The humber of days to hold untagged images"
  default     = 90
}
variable "life_cycle_policy_tagstatus" {
  type        = string
  description = "The status of the image tag"
  default     = "untagged"
}
variable "org" {
  type        = string
  description = "Namme used for the tag keys"
  default     = "my_org"
}
variable "owner" {
  type        = string
  description = "Repository Owner"
  default     = ""
}
variable "repo_name" {
  type        = string
  description = "Name of your ECR Repo"
}
variable "scan_on_push" {
  type        = bool
  description = "Enable vulnerability scanning on ECR repo"
  default     = true
}
variable "technicalcontact" {
  type        = string
  description = "Repository Technical Contact Email"
  default     = "me@example.com"
}

variable "principals_pull_access" {
  type        = list(string)
  description = "List of AWS principal ARNs that should have pull access to the repository"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to the ECR repository"
  default     = {}
}
