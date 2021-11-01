variable "vpc" {
  type = map
  default = {
    "cidr" = "172.16.0.0/16"
    "tag"  = "dt1_vpc"   
  }  
}

variable "public1" {
  type = map
  default = {
    "cidr" = "172.16.0.0/20"
    "tag"  = "dt1-public-1"
    "az"   = "us-east-2a"
  }
}

variable "public2" {
  type = map
  default = {
    "cidr" = "172.16.16.0/20"
    "tag"  = "dt1-public-2"
    "az"   = "us-east-2b"
  }
}

variable "igw_name" {
    
  default = "dt1-igw"
}
