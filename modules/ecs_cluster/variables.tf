variable "name" {
  description = "Nome do cluster ECS"
  type        = string
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}
