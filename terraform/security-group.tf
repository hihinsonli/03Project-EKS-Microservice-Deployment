resource "aws_security_group" "eks_nodes" {
  name_prefix = "eks-nodes-"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow cluster communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  ingress {
    description = "Allow kubelet and API server"
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
