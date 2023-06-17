resource "aws_instance" "webServer " {
  count                       = var.number_of_instance
  ami                         = module.ami_name.id
  instance_type               = var.instance_type
  subnet_id                   = element(module.subnet_id.id, count.index)
  user_data                   = "<powershell>${module.startup_script}<powershell>"
  monitoring                  = true
  vpc_security_group_ids      = Module.vpc_security_group_ids
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = false
  volume_tags                 = var.volume_tags
  metadata_options {
    http_endpoint          = "enable"
    instance_metadata_tags = "enable"
  }

  root_block_device {

  }
  tags = local.tags
  lifecycle {
    #May of these ignores have been added to accomodate imported resources without a rebuild. They should be remove eventually.
    ignore_changes = [root_block_device, iam_instance_profile, user_data, ami, volume_tags, ebs_optimized]
  }
}
