resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.micro.id

  tags = {
    Name = "igw"
  }
}
