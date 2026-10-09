resource "azurerm_resource_group" "rg" {
  name     = "heartfelt-rg"
  location = "canada central"
}

resource "azurerm_container_registry" "acr" {
  name                = "heartfeltacr12345"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                = "heartfelt-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "heartfelt"

  role_based_access_control_enabled = true

  api_server_access_profile {
    authorized_ip_ranges = ["49.36.188.136/32"]
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2ps_v6"
  }

  identity {
    type = "SystemAssigned"
  }
}
