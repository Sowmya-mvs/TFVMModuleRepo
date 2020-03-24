module "create-res-grp" {
    source      = "./modules/create_resource_group"
    resgrp    = "${var.resgrpname}"
    location  = "${var.rglocation}"
   
}

 module "create-avset" {
     source      = "./modules/create_availability_set"
    avset      = "${var.avsetname}" 
    resgrp=      "${module.create-res-grp.name}"
     location    = "${var.rglocation}"
    
     fault-domain-count="${var.fault-domain}"
     upgrade-domain-count="${var.upgrade-domain}"
     
}
module "create-dns" {
    source      = "./modules/create_dns"
    #resgrp      = "${var.resgrpname}"
     resgrp=      "${module.create-res-grp.name}"
    location    = "${var.rglocation}"
    dns-name    ="${var.dns-name}"
    a-name-record="${var.aname-record}"
    ttl          ="${var.ttl}"
    records      ="${var.records}"
}

module "create-external-lb" {
    source      = "./modules/create_external_lb"
    resgrp=      "${module.create-res-grp.name}"
    location    = "${var.rglocation}"
    lb-name     ="${var.ELB-name}"
    lb-pip-name ="${var.ELB-pip-name}"
    lb-pip-id   ="${var.ELB-pip-id}"
    backendpool-name      ="${var.backendpool-name}"
}
module "create-nsg" {
    source      = "./modules/create_network_security_group"
    resgrp=      "${module.create-res-grp.name}"
    location    = "${var.rglocation}"
    nsg         = "${var.nsg-name}"
}

module "create-sql" {
    source      = "./modules/create_sql"
    resgrp=      "${module.create-res-grp.name}"
    location  = "${var.rglocation}"
sql-server-name =  "${var.sql-servername}"
sql-db-name      =  "${var.sql-dbname}"
sql-server-version="${var.sql-serverversion}"
sql-server-username="${var.sql-serverusername}"
sql-server-password="${var.sql-serverpassword}"
}

module "create-storage-account" {
    source      = "./modules/create_storage_account"
    resgrp=      "${module.create-res-grp.name}"  
    location    = "${var.rglocation}"
    storageaccname="${var.storageaccname}"
    filesharename="${var.filesharename}" 
}


module "create-vnet" {
 source      = "./modules/create_virtual_network"
  countvalue       ="${var.countvalue}"
     resgrp=      "${module.create-res-grp.name}"  
    location    = "${var.rglocation}"    
    vnet-name   ="${var.vnet-name}"
    subnet-name ="${var.subnet-name}"
    vnet-address-space="${var.vnet-address-space}"
    subnet-address-prefix="${var.subnet-address-prefix}"
    nicname="${var.nicname}"
    nicipname="${var.nicipname}"
    vmpip="${var.vmpip}"
}

module "create-vm" {
    source      = "./modules/create_virtual_machine"
    countvalue       ="${var.countvalue}"
    resgrp=      "${module.create-res-grp.name}"  
    location    = "${var.rglocation}" 
    avset       ="${module.create-avset.name}"
    lb-name     ="${module.create-external-lb.lb-name}"
    lb-pip-id   ="${module.create-external-lb.lb-pip-id}"
    lb-pip-name ="${module.create-external-lb.lb-pip-name}"
    backendpool-name="${module.create-external-lb.backendpool-name}" 
    nsg         ="${module.create-nsg.nsg}"
   // nicname     ="${module.create-vnet.nicname}"
    nicipname ="${module.create-vnet.nicipname}"
    nicid     ="${module.create-vnet.nicid}"
    vnet-name  ="${module.create-vnet.vnet-name}"
    subnet-name="${module.create-vnet.subnet-name}"
    vmpip      ="${module.create-vnet.vmpip}"
    vm_image_offer="${var.vm_image_offer}" 
    vm_image_sku ="${var.vm_image_sku}" 
    vm_image_version="${var.vm_image_version}" 
    VM_ADMIN = "${var.VM_ADMIN}" 
    VM_PASSWORD="${var.VM_PASSWORD}" 
    vm_image_publisher="${var.vm_image_publisher}"
    computer_name="${var.computer_name}"
    vm_size="${var.vm_size}"    
    disk-storage-account-type="${var.disk-storage-account-type}"
    disk-create_option="${var.disk-create_option}"
    disk_size_gb="${var.disk_size_gb}"
}