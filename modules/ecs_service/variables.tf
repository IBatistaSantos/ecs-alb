variable "name" {
  description = "Nome do serviço ECS"
  type        = string
}

variable "cluster_id" {
  description = "ID do cluster ECS"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN da IAM Role de execução da tarefa ECS"
  type        = string
}

variable "container_name" {
  description = "Nome do contêiner"
  type        = string
}

variable "image" {
  description = "URI da imagem do contêiner"
  type        = string
}

variable "container_port" {
  description = "Porta do contêiner"
  type        = number
}

variable "cpu" {
  description = "CPU para a tarefa ECS"
  type        = string
}

variable "memory" {
  description = "Memória para a tarefa ECS"
  type        = string
}

variable "desired_count" {
  description = "Número desejado de tarefas"
  type        = number
}

variable "subnet_ids" {
  description = "IDs das subnets"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID do Security Group"
  type        = string
}

variable "target_group_arn" {
  description = "ARN do Target Group"
  type        = string
}

variable "alb_listener_arn" {
  description = "ARN do Listener do ALB"
  type        = string
}

variable "environment_file_arn" {
  description = "ARN do arquivo de ambiente no S3"
  type        = string
}

variable "log_group_name" {
  description = "Nome do grupo de logs"
  type        = string
}

variable "log_retention_in_days" {
  description = "Dias de retenção dos logs"
  type        = number
}

variable "region" {
  description = "Região da AWS"
  type        = string
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}
