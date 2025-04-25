private_subnets = ["10.0.6.0/24"]
public_subnets  = ["10.0.1.0/24"]
vpc_cidr = "10.0.0.0/16"

security_groups = [
  {
    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS from anywhere
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
      }
    ]
  }
]
