terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "heartfeltstate1234"
    container_name       = "tfstate"
    key                  = "heartfelt.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "e2ae98d7-8d18-48c7-9f27-a5aa26d3a904"
}
