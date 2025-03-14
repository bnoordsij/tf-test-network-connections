resource "aws_key_pair" "my_key_pair" {
  key_name   = "my-key-pair"            # Name for your key pair
  public_key = file("${path.module}/secrets/id_rsa.pub")
}

resource "aws_instance" "my-ec2" {
  count = 2
  ami           = "ami-0e063207e92b63437"
  instance_type = "t2.micro"

  key_name = aws_key_pair.my_key_pair.key_name
  subnet_id = aws_subnet.my_subnet.id
  vpc_security_group_ids = [
    aws_security_group.my_sg.id,
    aws_security_group.my_sg_http.id
  ]

  user_data = file("${path.module}/ec2-user-data.sh")
  tags = {
    Name = "terraform-ec2"
  }
}
