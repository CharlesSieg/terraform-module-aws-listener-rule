variable "listener_arn" {
  description = "ARN of the listener for which this rule is for."
  type        = string
}

variable "priority" {
  description = ""
  type        = string
}

variable "rule_condition_field" {
  description = "Specifies the type of listener rule to create. Options are host-header or path-pattern."
  type        = string
}

variable "rule_condition_value" {
  description = "Specifies the value that the listener rule checks."
  type        = string
}

variable "tg_arn" {
  description = "ARN of the target group for which this rule is for."
  type        = string
}
