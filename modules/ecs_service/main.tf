resource "aws_cloudwatch_log_group" "this" {
  name              = var.log_group_name
  retention_in_days = var.log_retention_in_days

  tags = var.tags
}

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn

  container_definitions = templatefile("${path.module}/templates/container_definitions.json.tpl", {
    container_name      = var.container_name,
    image               = var.image,
    container_port      = var.container_port,
    log_group_name      = var.log_group_name,
    log_region          = var.region,
    environment_file_arn = var.environment_file_arn
  })

  tags = var.tags
}

resource "aws_ecs_service" "this" {
  name            = "${var.name}-service"
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  depends_on = [var.alb_listener_arn]

  tags = var.tags
}
