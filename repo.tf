resource "aws_ecr_repository" "repo" { #tfsec:ignore:aws-ecr-repository-customer-key
  name = var.repo_name
  /* encryption_type = var.encryption_type
  kms_key         = var.kms_key_arn */
  force_delete = var.force_delete
  dynamic "encryption_configuration" { #tfsec:ignore:AWS093
    for_each = var.encryption_configuration != null ? [var.encryption_configuration] : [{ encryption_type = var.encryption_type, kms_key = null }]
    content {
      encryption_type = encryption_configuration.value.encryption_type
      kms_key         = encryption_configuration.value.kms_key
    }
  }
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  image_tag_mutability = var.repo_mutability
  tags                 = merge(local.default_tags, var.tags, tomap({ "Name" = var.repo_name }))
}
