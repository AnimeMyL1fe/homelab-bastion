output "vm_info" {
  value = {for k, v in proxmox_virtual_environment_vm.ubuntu_vm : k => {
    ip = split("/24", v.initialization[0].ip_config[0].ipv4[0].address)[0]
  }}
}