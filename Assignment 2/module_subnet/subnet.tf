


resource "aws_subnet" "sb_module-1" {
  vpc_id     = "${var.vpcid}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.subnet_name}"
  }
}

