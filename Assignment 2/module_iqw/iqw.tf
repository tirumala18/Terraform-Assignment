


resource "aws_internet_gateway" "own-gateway1" {
  vpc_id = "${var.vpcid}"

  tags = {
    Name = "${var.name}"
  }
}