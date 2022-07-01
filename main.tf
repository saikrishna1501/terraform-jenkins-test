resource "aws_security_group" "sg" {
  name        = "sgtest"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-094feaf7ee33d484b"

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-test"
  }
}
#comment

resource "aws_instance" "web" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t2.micro"
  subnet_id = "subnet-00ad5a974f5e8af44"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "public-ec2"
  }
}

