locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = var.tags

}