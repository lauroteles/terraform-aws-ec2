provider "aws" {
  region = var.region
}

resource "aws_instance" "ubuntu_processor" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name = var.key_name
  associate_public_ip_address = true

 vpc_security_group_ids = [var.security_group_id] 

 root_block_device {
    volume_size = --
  }

  tags = {
    Name = "FolhaDePagamentos"
  }
  
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.name}-profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_iam_role" "ec2_role" {
  name = var.name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_role_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role = aws_iam_role.ec2_role.name
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


