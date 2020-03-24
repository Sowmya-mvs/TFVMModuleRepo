/* Declare variables*/
provider "azurerm" {
  features{}
  subscription_id 	= var.subscription_id
  client_id 		    = var.client_id
  client_secret 	  = var.client_secret
  tenant_id 		    = var.tenant_id
}
variable "subscription_id" {
  description = "Subscription ID"
  default = "Removed for security reason"
}
variable "client_id" {
  description = "Web App Id"
  default = "Removed for security reason"
}
variable "client_secret" {
  description = "Key for Service principal"
  default = "Removed for security reason"
}
variable "tenant_id" {
  description = "Tenant ID from AD"
 default = "Removed for security reason"
}


