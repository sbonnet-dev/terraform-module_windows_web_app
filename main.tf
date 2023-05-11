resource "azurerm_windows_web_app" "windows_web_app" {
  name                = lower(format("wwapp-%s-%s-%s", var.project, var.environment, var.name))
  location                = var.location
  resource_group_name     = var.rg_name
  service_plan_id         = var.service_plan_id

  app_settings = {
    SCM_DO_BUILD_DURING_DEPLOYMENT = "true"
  }
  
  client_affinity_enabled = true
  logs {
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 100
      }
    }
  }

  site_config {
    always_on  = false
    ftps_state = "FtpsOnly"
    virtual_application {
      physical_path = "site\\wwwroot"
      preload       = false
      virtual_path  = "/"
    }
  }

  tags = {
    project     = var.project
    environment = var.environment
    owner       = var.owner
  }

}