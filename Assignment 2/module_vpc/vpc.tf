
resource "aws_vpc" "own-vpc" {
  cidr_block       = "${var.cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpcname}"
  }
}