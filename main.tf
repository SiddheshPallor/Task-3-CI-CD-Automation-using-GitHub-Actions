provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "web" {
	ami = "ami-0f5ee92e2d63afc18"
	instance_type = "t3.micro"
	key_name      = "siddhesh-key"
	

user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker pull sidh25/my-website
sudo docker run -d -p 80:80 sidh25/my-website
EOF


	tags = {
	
	Name = "Docker-Server"
}	 
}


# ew ec2 server 

resource "aws_instance" "web2" {
	ami = "ami-0f5ee92e2d63afc18"
	instance_type = "t3.micro"

	subnet_id = data.aws_subnet.subnet.id
	
	iam_instance_profile = aws_iam_instance_profile.profile.name

	key_name = "siddhesh-key"

	tags = {
	Name = "Second-Server"
}

}

resource "aws_security_group" "web_sg1" {
	name = "web-sg"

	ingress {
	from_port = 80
	to_port   = 80
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]  
}

        ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
 
	egress {
	from_port = 0
	to_port   = 0
	protocol  = "-1"
	cidr_blocks = ["0.0.0.0/0"]
}

}


#Fetch VPC usig tag

data "aws_vpc" "vpc" {
	filter {
	name = "tag:Name"
	values = ["portfolio-vpc"]
}
}

#Fetch Subnet  usig tag

data "aws_subnet" "subnet" {
	filter {
	name = "tag:Name"
	values = ["portfolio-subnet"]
}
}




resource "aws_iam_role" "ec2_role" {
	name = "ec2-s3-role"
	
	assume_role_policy = jsonencode({
		Version = "2012-10-17"
		Statement = [{
		Effect = "Allow"
		Principal = {
			Service = "ec2.amazonaws.com"
		}
		Action = "sts:AssumeRole"
		}]
	})
}


resource "aws_iam_role_policy_attachment" "s3_access" {
	role 	= aws_iam_role.ec2_role.name
	policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "profile" {
  name = "ec2-profile"
  role = aws_iam_role.ec2_role.name
}



