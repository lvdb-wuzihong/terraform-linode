provider "linode" {
  token = var.LINODE_TOKEN
}



resource "linode_instance" "instance_example" {
  count = var.count
  label           = "${var.instance_label}-${count.index}"
  region          = var.region
  type            = var.instance_type
  
  config {
    kernel = "linode/grub2"
    label = var.config_label
    memory_limit = 0
    root_device = "/dev/sda"
    run_level = "default"
    virt_mode = "paravirt"

    devices {
      sda {
        disk_label = "Centos 7 Disk"
      }
      sdb {
        disk_label = "512MB Swap Image"
      }
    }
    
    interface {
      purpose = "public"
    }
    interface {
      purpose = "vlan"
      label = "my-vlan"
      ipam_address = var.address
    }
  }
  disk {
    label = "Centos 7 Disk"
    image = var.image
    authorized_keys = var.authorized_keys
    root_pass = var.password
    size = 50688
    filesystem = "ext4"
  }
  disk {
    label = "512MB Swap Image"
    size = 512
    filesystem = "swap"
  }
}

