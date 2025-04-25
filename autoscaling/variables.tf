variable "launch_template_name" {
  type        = string
  description = "Prefix for the launch template name"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the instances"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "asg_name" {
  type        = string
  description = "Auto Scaling Group name"
}

variable "max_size" {
  type        = number
  default     = 3
}

variable "min_size" {
  type        = number
  default     = 1
}

variable "desired_capacity" {
  type        = number
  default     = 1
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for ASG"
}

variable "target_group_arn" {
  type        = string
  description = "Target group ARN for ALB"
}

variable "instance_name" {
  type        = string
  description = "Name tag for instances"
}
