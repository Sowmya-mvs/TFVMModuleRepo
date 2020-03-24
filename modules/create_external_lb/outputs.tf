
output "lb-name" {
    value = "${azurerm_lb.elb.name}"
}
output "lb-pip-id" {
    value = "${azurerm_public_ip.lb_pip.id}"
}
output "lb-pip-name" {
    value = "${azurerm_public_ip.lb_pip.name}"
}


output "backendpool-name" {
    value = "${azurerm_lb_backend_address_pool.backendpool.name}"
}
