variable "resgrp"{
  description="Resource Group"
 
}

variable "location"{
  description="EastUs"
 
}

variable "nsg"{
  description="Network Security Group"
  
}


variable "tags" {
  type=map
  default={
    Env="TF GS"
    Dept="Engineering"
  }
}
