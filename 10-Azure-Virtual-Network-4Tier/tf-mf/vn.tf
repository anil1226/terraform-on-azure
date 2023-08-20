terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.70.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "random_string" "myrandom" {
  length = 6
  upper = true
  special = false
  numeric = false
}

resource "azurerm_resource_group" "myrg" {
  name = "myrg-${random_string.myrandom.id}"
  location = "eastus"
  tags = {
    "used for" = "virtual network" 
  }
}