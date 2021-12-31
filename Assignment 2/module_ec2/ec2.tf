

#aws ec2 instance
resource "aws_instance" "ec2instance" {
   ami           = "${var.ami_id}"
   instance_type = "${var.inst_type}"
   subnet_id ="${var.sb_id}"
   vpc_security_group_ids = ["${var.sg_id}"]
   associate_public_ip_address = true
   key_name="${var.keyname}"
 tags={
     Name="${var.ec2_inst_tf}"
 }
}