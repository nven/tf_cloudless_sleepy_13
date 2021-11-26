# Configure these variables

variable "sample_var" {
  description = "A sample_var to pass to the template."
  default     = "hello"
}

variable "sensitive_var" {
  description = "A sensitive var to pass to the template."
  default     = "I am Sensitivie"
  
  
}

variable "sleepy_time" {
  description = "How long our local-exec will take a nap."
  default     = 0
}

variable "in_master_branch" {
  description = "How long our local-exec will take a nap."
  default     = 0
}

variable "TF_VERSION" {
  description = "terraform version."
  default     = 0.13
}

variable "aws_access_key" {
  description  = "AWS access key"
  type         = string
}

variable "aws_secret_key" {
  description  = "AWS secret key"
  type         = string
}

variable "aws_region" {
  description  = "AWS region"
  type         = string
  default      = "us-east-1"
}

variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  # default = "afasdf"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}

