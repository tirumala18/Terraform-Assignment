provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}


module "module_vpc"{
    source="./module_vpc"
    vpcname = "own-vpc-1"  
    cidr = "10.0.0.0/16"
}

module "module_security_group"{
    source="./module_security_group"
    sgname="sec1"
    vpcid="${module.module_vpc.vpc_id}"
}

module "module_iqw"{
    source ="./module_iqw"
    name="own-igw1"
    vpcid="${module.module_vpc.vpc_id}"
}

module "module_subnet"{
    source = "./module_subnet"
    subnet_name="own-sb-1"
    vpcid="${module.module_vpc.vpc_id}"
}

module "module_natgateway"{
    source ="./module_natgateway"
    sb_id="${module.module_subnet.sb_id_output}"
    name = "own-nat1"
}

module "module_ec2"{
    source ="./module_ec2"
    
  ami_id                  = "ami-0ed9277fb7eb570c9"
  inst_type          = "t2.micro"
  keyname               = "wl"
  sg_id                  = "${module.module_security_group.sg_id_output}"
  sb_id                  = "${module.module_subnet.sb_id_output}"
  ec2_inst_tf            = "ec2_module_instance"

}
