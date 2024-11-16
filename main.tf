# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}
variable "storageaccountname" {
  description = "Value of the name for the storage account"
  type        = string
  default     = "storageaccountsiva9999"
}
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup3"
  location = "westus2"
}
# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet2"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}
resource "azurerm_storage_account" "name" {
  name = var.storageaccountname
  location = "westus2"
  account_replication_type = "LRS"
  resource_group_name = azurerm_resource_group.rg.name
  account_tier = "Standard"
}
