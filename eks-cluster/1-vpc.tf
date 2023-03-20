resource "aws_vpc" "micro" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "micro"
  }
}
