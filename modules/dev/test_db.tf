resource "aws_db_instance" "test01" {
  identifier                  = "${var.app_name}-${var.env}-db01"
  name                        = "HANDSONDB"
  username                    = "tf"
  password                    = "password"
  availability_zone           = "${var.availability_zones[0]}"
  backup_retention_period     = 7
  backup_window               = "18:00-18:30"
  maintenance_window          = "tue:06:00-tue:06:30"
  multi_az                    = true
  publicly_accessible         = false
  apply_immediately           = false
  auto_minor_version_upgrade  = false
  allow_major_version_upgrade = false
  allocated_storage           = 10
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.6.35"
  instance_class              = "db.t2.micro"
  db_subnet_group_name        = "${aws_db_subnet_group.private.name}"
  parameter_group_name        = "default.mysql5.6"
}

resource "aws_db_instance" "test02" {
  identifier                  = "${var.app_name}-${var.env}-db02"
  name                        = "HANDSONDB"
  username                    = "tf"
  password                    = "password"
  availability_zone           = "${var.availability_zones[0]}"
  maintenance_window          = "tue:06:00-tue:06:30"
  multi_az                    = false
  publicly_accessible         = false
  apply_immediately           = false
  auto_minor_version_upgrade  = false
  allow_major_version_upgrade = false
  allocated_storage           = 10
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "5.6.35"
  instance_class              = "db.t2.micro"
  db_subnet_group_name        = "${aws_db_subnet_group.private.name}"
  parameter_group_name        = "default.mysql5.6"
  replicate_source_db         = "${aws_db_instance.test01.id}"
}

resource "aws_db_subnet_group" "private" {
  name        = "${var.env}-${var.app_name}-db-private"
  description = "Our main group of subnets"
  subnet_ids  = "${var.private_subnet_ids}"

  tags {
    Name = "${var.env}-${var.app_name}-db-private"
  }
}
