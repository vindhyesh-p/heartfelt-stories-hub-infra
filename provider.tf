terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>4.0"
        }
    }
}

terraform {
  backend "azurerm" {
    resource_group_name = "terraform-state-rg"
    storage_account_name = "heartfeltstate123"
    container_name = "tfstate"
    key = "heartfelt.tfstate"
  }
}

provider "azurerm"{
    features {}
    subscription_id = "27c01081-9358-44ee-9ac4-6d96c8dd32a2"
}