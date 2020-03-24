resource "azurerm_sql_server" "sqlserver" {
  name                         = var.sql-server-name
  resource_group_name          = var.resgrp
  location                     = var.location
  version                      = var.sql-server-version
  administrator_login          = var.sql-server-username
  administrator_login_password = var.sql-server-password
}

resource "azurerm_sql_database" "sqldb" {
  name                = var.sql-db-name
  resource_group_name = var.resgrp
  location            = var.location
  server_name         = azurerm_sql_server.sqlserver.name

  tags = var.tags
}