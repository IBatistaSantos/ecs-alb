variable "name" {
  description = "Nome do IAM Role"
  type        = string
}

variable "environment_file_arn" {
  description = "ARN do arquivo de ambiente no S3"
  type        = string
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}
