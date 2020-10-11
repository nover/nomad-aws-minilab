resource "aws_security_group" "nomad-sg" {
  name = "nomad-sg"
  vpc_id = aws_vpc.nomad-lab-vpc.id
 
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }
 
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }
 
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_network
  }
 
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Terraform = "true"
      Turbonomic = "true"
  }
}