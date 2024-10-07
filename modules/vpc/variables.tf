variable "name" {
  description = "Nome do VPC"
  type        = string
}

variable "cidr_block" {
  description = "Bloco CIDR do VPC"
  type        = string
}

variable "public_subnet_count" {
  description = "Número de subnets públicas"
  type        = number
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidade"
  type        = list(string)
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}
