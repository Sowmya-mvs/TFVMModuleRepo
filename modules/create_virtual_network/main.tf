resource "azurerm_virtual_network" "vnet" {
 name                = var.vnet-name
 address_space       = var.vnet-address-space
 location            = var.location
 resource_group_name = var.resgrp
 tags= var.tags
}

resource "azurerm_subnet" "subnet" {
 name                 = var.subnet-name
 resource_group_name  = var.resgrp
 virtual_network_name = azurerm_virtual_network.vnet.name
 address_prefix       = var.subnet-address-prefix
}

resource "azurerm_public_ip" "vmpip" {
  count               = var.countvalue
  name                = "PublicIp-${count.index}"
  location                     = var.location
 resource_group_name          = var.resgrp
 allocation_method            = "Static"
}

resource "azurerm_network_interface" "nicname" {
   count              = var.countvalue
  # Looking for multiple NICs use below line code
   name             = "NIC${count.index}" 
  location            = var.location
  resource_group_name = var.resgrp

  ip_configuration {
    #name                          = var.nicipname
    name                          = "NICIP"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id           = element(azurerm_public_ip.vmpip.*.id, count.index)
  }
  depends_on = [azurerm_public_ip.vmpip]
}