variable "resgrp"{
  description="Resource Group"

}

variable "location"{
  description="EastUs"
 
}

variable "vnet-name"{
  description="Virtual Network Name"
  
}
variable "vnet-address-space"{
  description="Virtual Network address space"
  
}

variable "subnet-name"{
  description="Subnet Name"
 
}

variable "subnet-address-prefix"{
  description="Virtual Network address space"
  
}

variable "countvalue" {
  description="Count of the instance"
  
}

variable "nicname"{
description="NIC Name"

}

variable "nicipname"{
description="IP name of NIC"

}


variable "vmpip"{
description="public ip of Virtual machine"

 }



variable "tags" { 
   
  default={
   ApplicationID="TST"
    Environment="TST"
    Name="VMImage-Test"
  }
  }
