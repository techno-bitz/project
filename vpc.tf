#######################################################################
# vpc
#######################################################################

resource "aws_vpc" "dt1_vpc" {
    
  cidr_block            =  var.vpc.cidr
  instance_tenancy      =  "default"
  enable_dns_hostnames  = true
  tags = {
    Name = var.vpc.tag
  }
}


#######################################################################
# public subent 1
#######################################################################

resource "aws_subnet" "public1" {
    
  vpc_id     = aws_vpc.dt1_vpc.id
  cidr_block = var.public1.cidr
  availability_zone = var.public1.az
  map_public_ip_on_launch = true
  tags = {
    Name = var.public1.tag
  }
}

#######################################################################
# public subent 2
#######################################################################

resource "aws_subnet" "public2" {

  vpc_id     = aws_vpc.dt1_vpc.id
  cidr_block = var.public2.cidr
  availability_zone = var.public2.az
  map_public_ip_on_launch = true
  tags = {
    Name = var.public2.tag
  }
}


#######################################################################
# IGW
#######################################################################

resource "aws_internet_gateway" "dt1-igw" {
    
  vpc_id = aws_vpc.dt1_vpc.id
  tags = {
    Name = var.igw_name
  }
}

