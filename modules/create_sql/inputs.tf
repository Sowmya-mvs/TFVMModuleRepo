variable "resgrp"{
  description="Resource Group"

}

variable "location"{
  description="EastUs"
  
}

variable "sql-server-name"{
  description="SQL Server Name"

}
variable "sql-db-name"{
  description="SQL Database Name"
 
}  
variable "sql-server-version"{
  description="SQL server version"
 
} 
variable "sql-server-username"{
  description="SQL server Login name"
 
} 
variable "sql-server-password"{
  description="SQL server password"
 
} 
variable "tags" { 
   
  default={    
    Name="AE_Edocs_RG"
     Environment="Development"
  }
  }
