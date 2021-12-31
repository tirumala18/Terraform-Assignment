
resource "aws_nat_gateway" "natgate" {
  #allocation_id = aws_eip.natgate.id
  connectivity_type = "private"
  subnet_id     = "${var.sb_id}"

  tags = {
    Name = "${var.name}"
  }

 
}