variable "tags" {
  type        = map(string)
  description = "Resource group tags."
}

variable "location" {
  type        = string
  description = "Azure region to use for deployment."
}

variable "custom_name" {
  type        = string
  default     = ""
  description = "If defined, resource group custom name."
}

variable "description" {
  type        = string
  default     = ""
  description = "Resource group description."
}

variable "caf_prefixes" {
  type        = list(string)
  default     = []
  description = "Prefixes to use for caf naming."
}

variable "name_separator" {
  type        = string
  description = "Separator for CAF prefixes in name."
  default     = ""
}
