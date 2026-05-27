# Intentionally insecure EC2 + security group. Do not deploy.

# BAD: ingress open to the world on SSH
resource "aws_security_group" "open" {
  name        = "iac-tests-open-sg"
  description = "allows all inbound"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t3.micro"

  # BAD: unencrypted root volume
  root_block_device {
    encrypted = false
  }

  # BAD: IMDSv1 allowed (no metadata hardening)
  vpc_security_group_ids = [aws_security_group.open.id]
}
