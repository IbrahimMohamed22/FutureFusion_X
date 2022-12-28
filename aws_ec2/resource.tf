# create vpc 

resource "aws_vpc" "myvpc"{
  cidr_block = "10.10.10.0/24"

    tags = {
        Name = "Main"
    }
}

# create subnet 

resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.10.10.0/28"
  availability_zone = "us-west-1a"

  tags = {
    Name = "Main_subnet"
  }
}

# create subnet 

resource "aws_instance" "myinstance" {
  ami           = "ami-005e54dee72cc1d00" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.mysubnet.id
    tags = {
      Name = "Main_instance"
    }
}