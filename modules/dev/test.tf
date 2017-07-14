resource "aws_instance" "test" {
  ami           = "ami-56d4ad31"
  instance_type = "${var.instance_types["test"]}"
  key_name      = "${var.uploaded_key}"

  vpc_security_group_ids = [
    "${var.common_security_group_ids["local"]}",
  ]

  subnet_id                   = "${var.public_subnet_ids[0]}"
  associate_public_ip_address = "false"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = "15"
    delete_on_termination = true
  }

  tags {
    Name = "${var.env}-${var.app_name}-test"
  }
}
