resource "aws_ecs_cluster" "this" {
  name = "${var.name}-cluster"

  tags = var.tags
}
