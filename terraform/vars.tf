## Common Configuration
variable "prefix" {
  type        = string
  description = "prefix for deconflicting named resources"
}

variable "domain_name" {
  type        = string
  description = "Root domain name"
}
