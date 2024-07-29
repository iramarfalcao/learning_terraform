provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "seguranca" {
  name = "seguranca"
  description = "Permitir acesso HTTP"
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}

# resource "aws_key_pair" "chave" {
#   key_name = "terraform-chave"
#   public_key = file("~/.ssh/id_ed25519.pub")
# }

resource "aws_instance" "servidor" {
  ami = "ami-0427090fd1714168b"
  instance_type = "t2.nano"
  user_data = file("user_data.sh")
  # key_name = aws_key_pair.chave.key_name
  vpc_security_group_ids = [ aws_security_group.seguranca.id ]
}

output "ip_externo" {
  value = aws_instance.servidor.public_dns
}