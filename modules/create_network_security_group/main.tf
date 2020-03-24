# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
    name                = var.nsg
    location            = var.location
   resource_group_name = var.resgrp

    security_rule {
        name                       = "RDP"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}