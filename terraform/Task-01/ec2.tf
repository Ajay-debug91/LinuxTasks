# ---------- Mumbai EC2 ----------
resource "aws_instance" "mumbai_instance" {
  provider = aws.mumbai

  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 in Mumbai
  instance_type = "t2.micro"
  
  tags = {
    Name = "Mumbai-Instance"
  }
}

# ---------- Virginia EC2 ----------
resource "aws_instance" "virginia_instance" {
  provider = aws.virginia

  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 in Virginia
  instance_type = "t2.micro"
  
  tags = {
    Name = "Virginia-Instance"
  }
}
