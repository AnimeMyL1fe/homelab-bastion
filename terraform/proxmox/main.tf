# -------------------
#
#   AnimeMyL1fe
#    made by
#
# -------------------

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  for_each    = var.vm_list
  name        = each.value.name
  node_name   = each.value.node_name
  vm_id       = each.value.id 

  clone {
    vm_id     = each.value.clone_id
  }

  cpu {
    cores     = var.profile_list[each.value.profile].cpu
    type      = "x86-64-v2-AES" 
  }

  memory {
    dedicated = var.profile_list[each.value.profile].ram
  }

initialization {
    ip_config {   
      ipv4 {
        address = "${each.value.address}/24"
        gateway = each.value.gateway
      }
    }

    user_account {
      keys     = [trimspace(file("~/.ssh/ru_vps_key.pub"))]
      username = "ubuntu"
    }
  
  }
}
