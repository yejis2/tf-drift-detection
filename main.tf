## VPC, Security group test
resource "aws_vpc" "vpc-test-stn" {
  cidr_block  = "10.0.0.0/16"

  tags = {
    Name = "vpc-test-stn"
  }
}

resource "aws_security_group" "poc-workspace_sg" {
  name        = "poc-workspace_sg"
  vpc_id = aws_vpc.vpc-test-stn.id
  description = "Security Group poc-workspace-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22  # SSH
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # 세 번째 ingress 규칙
  ingress {
    from_port   = 443  # HTTPS
    to_port     = 443
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
    Name = "poc-workspace"
  }
}
