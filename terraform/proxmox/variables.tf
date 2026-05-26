variable "vm_list" {
    type = map(object({
      name      = string
      node_name = string
      id        = number
      address   = string
      gateway   = string
      clone_id  = number
      profile   = string
      tags      = list(string)
    }))
}

variable "profile_list" {
  type = map(object({
    cpu = number
    ram = number
  }))
    default = {
      "db" = {
        cpu = 2
        ram = 2048
      }
    }
}

variable "user" {
  type = string
}
variable "ssh_key" {
  type = string
}
