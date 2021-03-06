terraform {
  backend "s3" {
    bucket = "dadams-terraform_remote_state"
    key = "vpc_peering_alb_router/vpc19.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}


#outputs for use by other sub-projects
#vpc level
output "vpc_id" {
  value = "${aws_vpc.vpc19.id}"
}
output "vpc_cidr_block" {
  value = "${aws_vpc.vpc19.cidr_block}"
}

#security groups

#roue tables
output "route_table_public" {
  value = "${aws_route_table.vpc19_public.id}"
}
output "route_table_private" {
  value = "${aws_route_table.vpc19_private.id}"
}

#subnets
output "subnet_public_us-east-1a" {
  value = "${aws_subnet.vpc19_public_us-east-1a.id}"
}
output "subnet_public_us-east-1b" {
  value = "${aws_subnet.vpc19_public_us-east-1b.id}"
}
output "subnet_public_us-east-1c" {
  value = "${aws_subnet.vpc19_public_us-east-1c.id}"
}
output "subnet_public_us-east-1d" {
  value = "${aws_subnet.vpc19_public_us-east-1d.id}"
}

output "subnet_private_us-east-1a" {
  value = "${aws_subnet.vpc19_private_us-east-1a.id}"
}
output "subnet_private_us-east-1b" {
  value = "${aws_subnet.vpc19_private_us-east-1b.id}"
}
output "subnet_private_us-east-1c" {
  value = "${aws_subnet.vpc19_private_us-east-1c.id}"
}
output "subnet_private_us-east-1d" {
  value = "${aws_subnet.vpc19_private_us-east-1d.id}"
}
