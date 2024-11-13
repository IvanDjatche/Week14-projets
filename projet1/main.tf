## called of all module

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = "10.10.0.0/16"
  Name       = "utc_vpc"
  Env        = "dev"
  Team       = "configuration Team"
}

module "ami" {
  source = "./modules/ami"
}

module "igw" {
  source     = "./modules/igw"
  vpc_id_igw = module.vpc.vpc_id
}

module "keypair" {
  source     = "./modules/keypair"
  key_name   = "utc_key"
  permission = "400"
}

module "ngw" {
  source = "./modules/ngw"
  # count = 2
  public_subnet_id = module.subnet.id2[0]
  domain           = "vpc"
  Name             = "utc_nat_gateway"
}

module "route_table" {
  source = "./modules/route_table"
  # count = 2
  vpc_id                = module.vpc.vpc_id
  cidr_block            = "0.0.0.0/0"
  internet_gateway_ids  = module.igw.igw_id
  nat_gateway_ids       = module.ngw.nat_gateway_id[0]
  Name                  = "utc_route_table"
  association_subnet_id = module.subnet.id2[1]
}

module "sg" {
  source        = "./modules/sg"
  my_ip         = ""
  vpc_id        = module.vpc.vpc_id
  cidr_blocks   = "0.0.0.0/0"
  app_name      = "utc_app_sg"
  alb_name      = "utc_alb_sg"
  bastian_name  = "utc_bastion_sg"
  database_name = "utc_database_sg"
  efs_name      = ""
  Team          = "dev"
  Env           = "Team configuration"
}

module "subnet" {
  source            = "./modules/subnet"
  vpc_id            = module.vpc.vpc_id
  vpc_cidr_block    = module.vpc.cidr_block
  availability_zone = "us-east-1"
  public_sub_count  = 2
  private_sub_count = 6
  private_sub_name  = "utc_private_sub"
  public_sub_name   = "utc_public_sub"
  Env               = "dev"
  Team              = "configuration Team"

}


module "bastion_instane" {
  source                    = "./modules/bastian_instance"
  ami_id                    = module.ami.ima_id
  key_name                  = "utc_key"
  instance_type             = "t2.nano"
  subnet_public_ids_bastion = module.subnet.id2[0]
  bastian_security_group    = module.sg.bastion_host_sg_id
  installFileBostion        = "installFileBostion.sh"
  Name                      = "utc_bastion_server"
  Env                       = "dev"
  Team                      = "configuration Team"
}

module "ec2_instance" {
  source                       = "./modules/ec2_instance"
  ami_id                       = module.ami.ima_id
  instance_type                = "t2.micro"
  private_subnet_ids_instance1 = module.subnet.id1[0]
  private_subnet_ids_instance2 = module.subnet.id2[1]
  app_security_group           = module.sg.app_server_sg_id
  key_name                     = "utc_key"
  instalFile                   = "install.sh"
  Name                         = "utc_app_server"
  Env                          = "dev"
  Team                         = "Team configuration"
  iam_instance_profile         = module.iam.iam_instance_profile_name
  ami_from_instance_name       = "utc-ami-App"
}

module "auto_scaling" {
  source                    = "./modules/auto_scaling"
  launch_template_id        = module.launch_template.launch_id
  target_group_arn          = module.target_group.target_group_arn
  health_check_type         = "EC2"
  health_check_grace_period = 300
  private_subnet_id         = module.subnet.id1[0]
  desired_capacity          = 2
  max_size                  = 4
  min_size                  = 1
  key                       = "dev"
  value                     = "config management"
}
module "efs" {
  source           = "./modules/efs"
  efs_sg_id        = module.sg.efs_sg_id
  private_subnets1 = module.subnet.id1[0]
  private_subnets2 = module.subnet.id1[1]
  creation_token   = "utc-efs"
  efs_name         = "utc-efs"
  Env              = "dev"
  Team             = "config management"
}
module "hosted_zone" {
  source                 = "./modules/hosted_zone"
  route53_zone_id        = "Z079408237HLHFOPQF4EE"
  subdomain_name         = "learning.ivandev.site"
  type                   = "A"
  evaluate_target_health = true
  alb_dns_name           = module.load_balancer.lb_dns
  alb_zone_id            = module.load_balancer.lb_zone_id
  # ttl                    = 300
  # records                = ""
}
module "launch_template" {
  source               = "./modules/launch_template"
  instance_type        = "t2.micro"
  resource_type        = "instance"
  image_id             = module.ec2_instance.ami_from_instance_id
  security_group_id    = module.sg.app_server_sg_id
  key_name             = "utc_key"
  launch_template_name = "utc-launch-template"
  Env                  = "dev"
  Team                 = "config managment"
}
module "load_balancer" {
  source                = "./modules/load_balencer"
  target_group_arn      = module.target_group.target_group_arn
  lb_type               = "application"
  lb_public_subnet      = module.subnet.id2[1]
  lb_security_group_ids = module.sg.alb_sg_id
  port                  = 80
  protocol              = "HTTP"
  type                  = "forward"
  lb_name               = "utc-alb"
  Env                   = "Env"
  Team                  = "config management"
}
module "rds" {
  source                = "./modules/rds_database"
  identifier            = "utc-dev-database"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  database_sg_ids       = module.sg.database_sg_id
  storage_type          = "gp2"
  engine                = "mysql"
  engine_version        = "8.0"
  max_allocated_storage = 100
  subnet_ids            = module.subnet.id1[1]
  username              = "utcuser"
  password              = "utcdev12345"
  db_subnet_name        = "utc-db-subnet-group"
  db_instance_Name      = "utc-dev-database"
  Env                   = "dev"
  Team                  = "config management"
}
module "target_group" {
  source              = "./modules/target_group"
  vpc_id              = module.vpc.vpc_id
  instance1_target_id = module.ec2_instance.app_1a_id
  instance2_target_id = module.ec2_instance.app_1b_id
  protocol            = "HTTP"
  protocol_version    = "HTTP1"
  target_type         = "instance"
  path                = "/"
  port                = 80
  Name                = "utc-target-group"
  Env                 = "dev"
  Team                = "config management"
}
module "iam" {
  source                        = "./modules/iam"
  iam_role_name                 = "ec2-s3-access-role"
  iam_role_service              = "ec2.amazonaws.com"
  iam_policy_name               = "S3FullAccessPolicy"
  aws_iam_instance_profile_name = "ec2-s3-instance-profile"
  Env                           = "dev"
  Team                          = "config management"
}
