provider "aws" {
  region = "us-east-1"
}

/*
#not supported until terraform 8
data "aws_hosted_zone" "dadams_io" {
  name = "dadams.io."
}
*/

data "aws_ami" "centos" {
  most_recent = true
  filter {
    name = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["679593333241"] # Centos
}

resource "aws_instance" "testinstance" {
    #ami = "ami-6d1c2007"  #Centos
    ami = "${data.aws_ami.centos.id}"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-6e386a13","sg-72b7eb0f"] #default, ping_ssh
    key_name = "Desktop"
    associate_public_ip_address = true
    tags {
        Name = "TerraformTest"
        Environment = "Stage"
    }
}

resource "aws_route53_record" "testrecord" {
  #zone_id = "${data.aws_hosted_zone.dadams_io.zone_id}"
  zone_id = "ZEMD7XEJVSLN3"
  name = "terraforminstance.dadams.io"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.testinstance.public_ip}"]
}
