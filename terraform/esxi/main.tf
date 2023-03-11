terraform {
  required_version = ">= 0.12"
}

provider "esxi" {
  esxi_hostname      = "$esxi_hostname"
  esxi_hostport      = "22"
  esxi_hostssl       = "443"
  esxi_username      = "$esxi_user"
  esxi_password      = "$esxi_pass"
}

resource "esxi_guest" "vmtest" {
  guest_name         = "vmtest"
  disk_store         = "MyDiskStore"

  #
  #  Specify an existing guest to clone, an ovf source, or neither to build a bare-metal guest vm.
  #
  #clone_from_vm      = "Templates/centos7"
  #ovf_source        = "/local_path/centos-7.vmx"

  network_interfaces {
    virtual_network = "VM Network"
  }
}
