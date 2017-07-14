resource "aws_security_group" "local" {
  name        = "${var.env}-${var.app_name}-ALLFromLocal"
  description = "Allow All From Local Network"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = "${var.vpc_cidrs}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env}-${var.app_name}-ALLFromLocal"
  }
}
