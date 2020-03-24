variable "resgrp"{
  description="Resource Group"
  }

variable "location"{
  description="EastUs"
 }

variable "dns-name"{
  description="DNS Name"
}
variable "a-name-record"{
  description="A name domain record"
 }  

variable "ttl"{
  description="value of time to live"
 
}

variable "records"{
  description="records"
  #default=["127.0.0.1"]
}

variable "tags" { 
   
  default={
   ApplicationID="TST"
    Environment="TST"
    Name="VMImage-Test"
  }
  }
