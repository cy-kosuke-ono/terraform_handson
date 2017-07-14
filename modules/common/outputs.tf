output "common_security_group_ids" {
  value = "${
      map(
        "local", "${aws_security_group.local.id}",
      )
    }"
}
