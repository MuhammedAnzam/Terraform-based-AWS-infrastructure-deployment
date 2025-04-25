variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the target group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "deletion_protection" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}

variable "listener_port" {
  description = "Port for the listener"
  type        = number
  default     = 80
}

variable "listener_protocol" {
  description = "Protocol for the listener"
  type        = string
  default     = "HTTP"
}

variable "target_group_port" {
  description = "Port for target group traffic"
  type        = number
  default     = 80
}

variable "target_group_protocol" {
  description = "Protocol for target group traffic"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Path for ALB health checks"
  type        = string
  default     = "/"
}

variable "instance_ids" {
  description = "EC2 instance IDs to attach to the target group"
  type        = map(string)
}
