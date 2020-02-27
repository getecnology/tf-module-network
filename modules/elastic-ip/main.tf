/* For more details on the configuration, visit the official documentation::
https://www.terraform.io/docs/providers/aws/r/eip.html
 */

locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

resource "aws_eip" "eip" {
  vpc   = true
  count = var.subnet_count

  tags = var.tags
}