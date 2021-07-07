## Create key pair
# resource "aws_key_pair" "ubuntu-key-pair" {
#   key_name   = "ubuntu-vms"
#   public_key = file("ubuntu-vms.pub")
# }

## Create two Ubuntu instances
resource "aws_instance" "ubuntu" {
  count                  = var.instance_count
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
#   key_name               = aws_key_pair.ubuntu-key-pair.key_name
  subnet_id              = aws_subnet.fra_vpc_subnet.id
  security_groups        = ["${aws_security_group.fra_vpc_sg.id}"]

  tags = {
    Name = "ubuntu-${count.index + 1}"
  }
}
