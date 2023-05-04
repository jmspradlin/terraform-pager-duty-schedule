# Provider Variables
variable pagerduty_token {
  type        = string
  default     = ""
  description = "Token for PagerDuty Access"
}

# Team Variables
variable "pagerduty_user_existing" {
  type        = map(any)
  default     = ""
  description = "Map of all EXISTING PagerDuty users to be imported as data references."
}
variable "pagerduty_manager" {
  type        = map(any)
  default     = ""
  description = "List of all NEW Pagerduty Managers to be added"
}
variable "pagerduty_user" {
  type        = map(any)
  default     = ""
  description = "Map of all NEW PagerDuty users to be added."
}
variable "product_owner" {
  type        = map(any)
  default     = ""
  description = "Product Owner to be added"
}
variable "director" {
  type        = map(any)
  default     = ""
  description = "Director to be added"
}

# Schedule Variables
variable "schedule" {
  type = string
  default = {
    name                         = "Example On-Call Rotation"
    time_zone                    = "America/Chicago"
    layer_name                   = "On-Call"
    start                        = "2023-01-01T00:00:00-05:00"
    rotation_virtual_start       = "2023-01-01T00:00:00-05:00"
    rotation_turn_length_seconds = 259200
  }
  description = "Default schedule for rotating on-call"
}
