variable "resgrp"{
  description="Resource Group"
 
}

variable "location"{
  description="EastUs"

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

variable "tags" {
  type=map
  default={
    Env="TF GS"
    Dept="Engineering"
  }
}
