output "name" {
  value = "${module.create-res-grp.name}"
}


output "avsetname" {
  value = "${module.create-avset.name}"
}

# output "dns" {
#   value = "${module.create-dns.id}"
# }

output "ELB-name" {
  value = "${module.create-external-lb.lb-name}"
}
output "lb-pip-id" {
  value = "${module.create-external-lb.lb-pip-id}"
}


output "lb-pip-name" {
  value = "${module.create-external-lb.lb-pip-name}"
}

output "backendpoolname" {
    value = "${module.create-external-lb.backendpool-name}"
}

output "nsg-name" {
  value = "${module.create-nsg.nsg}"
}

output "vnet" {
  value = "${module.create-vnet.vnet-name}"
}

output "subnet" {
  value = "${module.create-vnet.subnet-name}"
}

output "nicid" {
  value = "${module.create-vnet.nicid}"
}

output "nicname" {
  value = "${module.create-vnet.nicname}"
}
output "nicipname" {
  value = "${module.create-vnet.nicipname}"
}


output "vmpip" {
  value = "${module.create-vnet.vmpip}"
}

