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
  default = "807b3293-7ac3-450c-8876-59aa17fdf275"
}
variable "client_id" {
  description = "Web App Id"
  default = "f33a284e-ad7a-45fb-aa8f-85d62b328426"
}
variable "client_secret" {
  description = "Key for Service principal"
  default = "uCw2B0ksV9T-]kEs1Iv-Symq]mGq?dxe"
}
variable "tenant_id" {
  description = "Tenant ID from AD"
  default = "687f51c3-0c5d-4905-84f8-97c683a5b9d1"
}

