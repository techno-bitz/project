terraform {
  backend "s3" {
    bucket = "dt1-tw"
    key    = "myapp/terraform.tfstate"
    region = "eu-west-1"
  }
}
