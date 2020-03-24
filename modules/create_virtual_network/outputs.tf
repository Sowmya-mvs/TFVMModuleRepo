output "vnet-name" {
  value = "${azurerm_virtual_network.vnet.name}"
}

output "vmpip" {
  value = "${azurerm_public_ip.vmpip.*.ip_address}"
}

output "subnet-name" {
  value = "${azurerm_subnet.subnet.name}"
}


output "nicid" {
  value = "${azurerm_network_interface.nicname.*.id}"
}

output "nicname" {
  value = "${azurerm_network_interface.nicname.*.name}"
}

output "nicipname" {
  value = "${azurerm_network_interface.nicname.*.name}"
}

