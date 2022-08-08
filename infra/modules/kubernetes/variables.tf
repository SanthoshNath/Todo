# Cannot be updated
variable "service_name" {
  type     = string
  nullable = false
}

variable "service_selector" {
  type     = map(any)
  nullable = false
}

variable "service_port" {
  type     = list(map(any))
  nullable = false

  validation {
    condition     = length(var.service_port) >= 1
    error_message = "Service port cannot not be empty"
  }
}

# Cannot be updated
variable "deployment_name" {
  type     = string
  nullable = false
}

variable "deployment_replicas" {
  type = number
}

variable "deployment_labels" {
  type     = map(any)
  nullable = false
}

# Container cannot be updated

variable "deployment_container_image" {
  type     = string
  nullable = false
}

# Cannot be updated
variable "deployment_container_name" {
  type     = string
  nullable = false
}

# Cannot be updated
variable "deployment_container_port" {
  type = list(number)
}
