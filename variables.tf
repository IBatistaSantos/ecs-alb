variable "region" {
  description = "Região da AWS"
  type        = string
}

variable "name" {
  description = "Nome base para os recursos"
  type        = string
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
}

variable "vpc_cidr_block" {
  description = "Bloco CIDR do VPC"
  type        = string
}

variable "public_subnet_count" {
  description = "Número de subnets públicas"
  type        = number
}

variable "listener_port" {
  description = "Porta do listener do ALB"
  type        = number
}

variable "container_port" {
  description = "Porta do contêiner"
  type        = number
}

variable "health_check_path" {
  description = "Caminho para o health check"
  type        = string
}

variable "health_check_interval" {
  description = "Intervalo do health check"
  type        = number
}

variable "health_check_timeout" {
  description = "Timeout do health check"
  type        = number
}

variable "healthy_threshold" {
  description = "Limite para considerar saudável"
  type        = number
}

variable "unhealthy_threshold" {
  description = "Limite para considerar não saudável"
  type        = number
}

variable "health_check_matcher" {
  description = "Código HTTP para considerar sucesso no health check"
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
