resource "aws_ebs_volu" "additionalvolume" {
    count = length(var.additional_drives) * var.number_of_instance
    availability_zones = element(var.subnet_az, count.index)
    size = element(var.additional_drives, floor(count.index / var.number_of_instance))
    encrypted = true
    type = "gp3"
    #IOPS and throughput are calculated to ensure the same or better performance when compared to a GP2 volume of the same size.
    iops = min(max((tonumber(element(var.additional_drives, floor(count.index / var.number_of_instance))))))

  
}