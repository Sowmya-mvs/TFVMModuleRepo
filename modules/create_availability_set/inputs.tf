variable "resgrp"{
  description="Resource Group"
  
}
variable "location"{
  description="EastUs"
  
}
variable "avset"{
  description="Avalability Set Name"
 
}
variable "fault-domain-count"{
  description="Count of fault domain"
 
}
variable "upgrade-domain-count"{
  description="Count of upgrade domain"
  
}

variable "tags" {
  type=map
default={
        Env="Dev"
        Dept="IT"
 }
}