resource "azurerm_public_ip" "lb_pip" {
 name                         = var.lb-pip-name
 location                     = var.location
 resource_group_name          = var.resgrp
 allocation_method            = "Static"
}

resource "azurerm_lb" "elb" {
 name                = var.lb-name
 location            = var.location
 resource_group_name = var.resgrp

 frontend_ip_configuration {
   name                 = var.lb-pip-id
   public_ip_address_id = azurerm_public_ip.lb_pip.id
 }
}

resource "azurerm_lb_backend_address_pool" "backendpool" {
 resource_group_name = var.resgrp
 loadbalancer_id     = azurerm_lb.elb.id
 name                = var.backendpool-name
}

