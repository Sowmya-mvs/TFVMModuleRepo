variable "resgrpname"{
  description="Resource Group"
  # default="AE_EDocs_RG"
}

variable "rglocation"{
  description="EastUs"
  # default="EastUS"
}

variable "avsetname"{
  description="Avalability Set Name"
  #default="Avalability-Set"
}
variable "fault-domain"{
  description="Count of fault domain"
  #default="2"
}
variable "upgrade-domain"{
  description="Count of upgrade domain"
  #default="3"
}


variable "dns-name"{
  description="DNS Name"
 # default="adb.aenetworks.com"
}
variable "aname-record"{
  description="A name domain record"
 # default="edocs"
}  

variable "ttl"{
  description="value of time to live"
  #default="300"
}

variable "records"{
  description="records"
  #default=["127.0.0.1"]
}

variable "ELB-name"{
  description="Load Balancer Name"
  #default="LB-Name"
}

variable "ELB-pip-name"{
  description="Load Balancer PIP Name"
 # default="LB-PIP-Name"
}

variable "ELB-pip-id"{
  description="Load Balancer PIP ID"
 # default="LB-PIP-ID"
}
variable "backendpool-name"{
  description="Backend pool name"
 # default="backendpool-name"
}
variable "nsg-name"{
  description="Network Security Group"
  # default="NSG "
}
variable "sql-servername"{
  description="SQL Server Name"
 # default="edocsdev"
  #tags=var.tags
}
variable "sql-dbname"{
  description="SQL Database Name"
  #default="DEV_eDOCS_admin"
}  
variable "sql-serverversion"{
  description="SQL server version"
  #default="12.0"
} 
variable "sql-serverusername"{
  description="SQL server Login name"
  #default="4dm1n157r470r"
} 
variable "sql-serverpassword"{
  description="SQL server password"
 # default="4-v3ry-53cr37-p455w0rd"
} 
variable "storageaccname"{
  description="Storage Account Name"
 # default="edocsstorageacc"
}
variable "filesharename"{
  description="Fileshare name"
  #default="edocsfileshare"
}

variable "vnet-name"{
  description="Virtual Network Name"
  #default="AE_Docs_RG-vnet"
}

variable "vnet-address-space"{
  description="Virtual Network address space"
  
}

variable "subnet-name"{
  description="Subnet Name"
  #default="default"
}

variable "subnet-address-prefix"{
  description="Virtual Network address space"
  #default="AE_Docs_RG-vnet"
}

variable "vm_image_offer" {
//Get-AzureRMVMImageOffer -Location 'uksouth' -Publisher 'MicrosoftWindowsServer' | Select Offer
description = "vm image vendor's VM offering"
#default = "WindowsServer"
}
variable "vm_image_sku" {
#default = "2016-Datacenter"
}
variable "vm_image_version" {
description = "vm image version"
#default = "latest"
}
variable "VM_ADMIN" {
description = "Admin Name"
#default = "VMAdmin"
}
variable "VM_PASSWORD" {
description = "password"
#default = "Password@123"
}
variable "vm_image_publisher" {
description = "vm_image_publisher"
#default = "Password@123"
}
variable "computer_name" {
description = "Computer Name"

}
variable "vm_size"{
  description="VM Size"
  
}
variable "disk-storage-account-type"{
  description="disk-storage-account-type"

}
variable "disk-create_option"{
  description="disk-create_option"
  
}
variable "disk_size_gb"{
  description="disk-create_option"
  
}

variable "countvalue" {
  description="Public IP count"
 
}

variable "vmpip"{
  description="Public IP"
 
}
variable "nicname"{
description="NIC Name"

}

variable "nicipname"{
description="IP name of NIC"

}





variable "tags" {
  type=map
default={
        Env="Dev"
        Dept="IT"
 }
}

