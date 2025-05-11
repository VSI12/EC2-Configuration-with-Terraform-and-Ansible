resource "tls_private_key" "key-pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key-pair" {
  key_name   = "${var.ec2_name}-key-pair"
  public_key = tls_private_key.key-pair.public_key_openssh
}
resource "local_file" "private_key" {
  content  = tls_private_key.key-pair.private_key_pem
  filename = "../Ansible/ec2-key.pem"
}

resource "aws_instance" "app_server" {
  ami             = "ami-0f88e80871fd81e91"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.key-pair.key_name
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "Flask-Server"
  }
}

resource "aws_security_group" "app_sg" {
  name = "app_sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 5000
    to_port     = 5000
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
output "public_ip" {
  value = aws_instance.app_server.public_ip
}
