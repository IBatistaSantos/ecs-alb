variable "name" {
  description = "Nome do ALB"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets"
  type        = list(string)
}

variable "listener_port" {
  description = "Porta do listener do ALB"
  type        = number
}

variable "container_port" {
  description = "Porta do container"
  type        = number
  
}

variable "target_port" {
  description = "Porta do alvo"
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

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}
