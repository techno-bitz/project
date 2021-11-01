################################################################
# Security Group Webserver Access
################################################################


resource "aws_security_group" "dt1-ecs-sg" {
    
    
  name        = "dt1-ecs-sg"
  description = "allow 80,443 only"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0"]
  }

    
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dt1-ecs-sg"
  }
}

################################################################
# Security Group Remote Access
################################################################

resource "aws_security_group" "dt1-remote" {
    
    
  name        = "dt1-remote"
  description = "allow 22 only"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0"]
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dt1-remote"
  }
}

