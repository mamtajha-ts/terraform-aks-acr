resource azurerm_postgresql_server postgresserver {
  name                = var.postgres_name
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.aks_demo_rg.name

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  version                      = "11"
  ssl_enforcement_enabled      = true
  sku_name                     = var.sku_name
  auto_grow_enabled            = true
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
}

resource "azurerm_postgresql_firewall_rule" "firewallrule" {
  name                = "aks"
  resource_group_name = azurerm_resource_group.aks_demo_rg.name
  server_name         = azurerm_postgresql_server.postgresserver.name
  start_ip_address    = "40.112.8.12"
  end_ip_address      = "40.112.8.12"
}

resource "azurerm_postgresql_database" "postgresdb" {
  name                = "postgresnewdb"
  resource_group_name = azurerm_resource_group.aks_demo_rg.name
  server_name         = azurerm_postgresql_server.postgresserver.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
