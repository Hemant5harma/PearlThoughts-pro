resource "aws_ecr_repository" "medusa_ecr_repo" {
  name = "medusa-backend"
  image_scanning_configuration { scan_on_push = true }
  image_tag_mutability = "MUTABLE"
}
