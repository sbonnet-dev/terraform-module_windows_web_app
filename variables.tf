variable "environment" {
  type        = string
  description = "Specify the type of environement"
  default     = "dev"

  validation {
    condition = contains([
      "dev",
      "prod",
    ], var.environment)
    error_message = "Then environment value is invalid."
  }
}

variable "location" {
  type        = string
  default     = "francecentral"
  description = "location for this ressource group. Possible location are francecentral or westeurope"

  validation {
    condition = contains([
      "francecentral",
      "westeurope",
      "northeurope",
      "unitedstates",
      "canadaeast"
    ], var.location)
    error_message = "The location value is invalid."
  }
}

variable "name" {
  type        = string
  description = "Resource name"
}


variable "rg_name" {
  type        = string
  description = "Resouce group name"
}


variable "project" {
  type        = string
  description = "Resource group name"
  default     = "OSCAR"
}


variable "owner" {
  type        = string
  description = "Owner name"
  default     = "SBO"
}

variable "service_plan_id" {
    type = string
    description = "Service Plan ID"
}