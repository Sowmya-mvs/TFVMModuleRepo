# resource "azurerm_resource_group" "resgrp" {
#  name     = var.resgrp
#  location = var.location
# }

# resource "azurerm_virtual_network" "vnet" {
#  name                = var.vnet-name
#  address_space       = ["10.1.0.0/24"]
#  location            = azurerm_resource_group.resgrp.location
#  resource_group_name = azurerm_resource_group.resgrp.name
#  tags= var.tags
# }

# resource "azurerm_subnet" "subnet" {
#  name                 = var.subnet-name
#  resource_group_name  = azurerm_resource_group.resgrp.name
#  virtual_network_name = azurerm_virtual_network.vnet.name
#  address_prefix       = "10.1.0.0/24"
# }
# resource "azurerm_public_ip" "vmpip" {
#   count               = var.countvalue
#   name                = "edocs-${count.index}-pip"
#   location                     = azurerm_resource_group.resgrp.location
#  resource_group_name          = azurerm_resource_group.resgrp.name
#  allocation_method            = "Static"
# }
# resource "azurerm_public_ip" "elb-lb-pip" {
#  name                         = var.lb-pip-name
#  location                     = azurerm_resource_group.resgrp.location
#  resource_group_name          = azurerm_resource_group.resgrp.name
#  allocation_method            = "Static"
# }
# resource "azurerm_lb" "ELB" {
#  name                = var.lb-name
#  location            = azurerm_resource_group.resgrp.location
#  resource_group_name = azurerm_resource_group.resgrp.name

#  frontend_ip_configuration {
#    name                 = var.lb-pip-name
#    public_ip_address_id = azurerm_public_ip.elb-lb-pip.id
#  }
# }

# resource "azurerm_lb_backend_address_pool" "backendpool-name" {
#  resource_group_name = azurerm_resource_group.resgrp.name
#  loadbalancer_id     = azurerm_lb.ELB.id
#  name                = var.backendpool-name
# }

# # Create Network Security Group and rule

# resource "azurerm_network_security_group" "nsg" {
#     name                = var.nsg
#  location             = azurerm_resource_group.resgrp.location
#  resource_group_name  = azurerm_resource_group.resgrp.name

#     security_rule {
#         name                       = "RDP"
#         priority                   = 101
#         direction                  = "Inbound"
#         access                     = "Allow"
#         protocol                   = "Tcp"
#         source_port_range          = "*"
#         destination_port_range     = "3389"
#         source_address_prefix      = "*"
#         destination_address_prefix = "*"
#     }
# }

# resource "azurerm_network_interface" "nic" {
#  count               = var.countvalue
#  name                = "edocs${count.index}nic"
#  location            = azurerm_resource_group.resgrp.location
#  resource_group_name = azurerm_resource_group.resgrp.name

#  ip_configuration {
#    name                          = var.nicipname
#    subnet_id                     = azurerm_subnet.subnet.id
#    private_ip_address_allocation = "dynamic"
#   public_ip_address_id           = element(azurerm_public_ip.vmpip.*.id, count.index)
   
#  }
#  depends_on = [azurerm_public_ip.vmpip]
# }

# resource "azurerm_availability_set" "avset" {
#  name                         = var.avset
#  location             = azurerm_resource_group.resgrp.location
#  resource_group_name  = azurerm_resource_group.resgrp.name
#  platform_fault_domain_count  = 2
#  platform_update_domain_count = 3
#  managed                      = true
# }

resource "azurerm_managed_disk" "vmmanageddisk" {
 count                = var.countvalue
 name                 = "datadisk_${count.index}"
 location             = var.location
 resource_group_name  = var.resgrp
 storage_account_type = var.disk-storage-account-type
 create_option        = "Empty"
 disk_size_gb         = var.disk_size_gb 
}



resource "azurerm_virtual_machine" "vm" {
 count                 = var.countvalue
 name                  = "AENet-Edocs-VM${count.index}"
 location              = var.location
 #availability_set_id   = azurerm_availability_set.avset.id
 resource_group_name   = var.resgrp
 #network_interface_ids = [element(azurerm_network_interface.nic.*.id, count.index)]
 network_interface_ids = var.nicid
 vm_size               = var.vm_size

 # Uncomment this line to delete the OS disk automatically when deleting the VM
 delete_os_disk_on_termination = true

 # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.vm_image_publisher
    offer = var.vm_image_offer
    sku = var.vm_image_sku
    version = var.vm_image_version
    }

 storage_os_disk {
   name              = "myosdisk${count.index}"
   caching           = "ReadWrite"
   create_option     = "FromImage"
   managed_disk_type = "Standard_LRS"
 }


 os_profile {
   computer_name  = var.computer_name
   admin_username = var.VM_ADMIN
   admin_password = var.VM_PASSWORD
 }

    os_profile_windows_config {
    provision_vm_agent = "true"
    enable_automatic_upgrades = "true"
    winrm {
    protocol = "http"
    certificate_url =""
}
}
}