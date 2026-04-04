provider "aws" {
	region = "ap-south-1"
}

resource "aws_instance" "web" {
	ami = "ami-0f5ee92e2d63afc18"
	instance_type = "t3.micro"
	key_name      = "siddhesh-key"
	vpc_security_group_ids = [aws_security_group.web_sg1.id]

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
