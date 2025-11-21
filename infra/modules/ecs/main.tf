# ECS + Fargate module (template)
resource "aws_ecs_cluster" "this" {
  name = var.name
}

# Example task definition (minimal)
resource "aws_ecs_task_definition" "service" {
  family                   = "${var.name}-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = tostring(var.cpu)
  memory                   = tostring(var.memory)
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn
  container_definitions    = var.container_definitions
}

resource "aws_ecs_service" "this" {
  name            = "${var.name}-svc"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.service.arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count

  network_configuration {
    subnets         = var.subnets
    security_groups = var.security_groups
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  depends_on = []
}
