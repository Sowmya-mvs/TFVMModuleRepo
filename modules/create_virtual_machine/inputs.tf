variable "resgrp"{
  description="Resource Group"
  
}

variable "location"{
  description="EastUs"
 
}
variable "vmpip"{
  description="Public IP"
 
}

variable "countvalue" {
  description="Public IP count"
 
}
variable "lb-name"{
  description="Load Balancer Name"
  
}

variable "lb-pip-name"{
  description="Load Balancer PIP Name"
  
}

variable "lb-pip-id"{
  description="Load Balancer PIP ID"
 
}
variable "backendpool-name"{
  description="Backend pool name"
 
}
variable "nsg"{
  description="Network Security Group"
 
}

variable "nicipname"{
  description="NIC"
 
}
variable "disk-storage-account-type"{
  description="disk-storage-account-type"

}
variable "disk-create_option"{
  description="disk-create_option"
  
}
variable "disk_size_gb"{
  description="disk_size_gb"
  
}
variable "avset"{
  description="Avalability Set Name"
  
}


variable "vm_size"{
  description="VM Size"
  
}
variable "vnet-name"{
  description="Virtual Network Name"
 
}
variable "subnet-name"{
  description="Subnet Name"
  
}


variable "vm_image_publisher" {
// Get-AzureRmVMImagePublisher -Location 'uksouth' | Select PublisherName
description = "vm image vendor"

}
variable "vm_image_offer" {
//Get-AzureRMVMImageOffer -Location 'uksouth' -Publisher 'MicrosoftWindowsServer' | Select Offer
description = "vm image vendor's VM offering"

}
variable "vm_image_sku" {
description="vm sku type"
}
variable "vm_image_version" {
description = "vm image version"

}

variable "computer_name" {
description = "Computer Name"

}
variable "VM_ADMIN" {
description = "Admin Name"

}
variable "VM_PASSWORD" {
description = "password"

}


variable "nicid" {
description = "NIC ID"

}


variable "tags" { 
   
  default={
   ApplicationID="TST"
    Environment="TST"
    Name="VMImage-Test"
  }
  }
