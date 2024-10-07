[
  {
    "name": "${container_name}",
    "image": "${image}",
    "essential": true,
    "portMappings": [
      {
        "containerPort": ${container_port},
        "protocol": "tcp"
      }
    ],
    "environmentFiles": [
      {
        "type": "s3",
        "value": "${environment_file_arn}"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "${log_group_name}",
        "awslogs-region": "${log_region}",
        "awslogs-stream-prefix": "ecs"
      }
    }
  }
]
