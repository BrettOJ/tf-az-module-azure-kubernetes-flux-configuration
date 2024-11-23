
locals {

  naming_convention_info = {
    site = "sg"
    name = "001"
    app  = "web"
    env  = "prd"
  }

  tags = {
    createdBy = "Terraform"
  }

}

module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    1 = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags = {

      }
    }
  }
}


resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "example-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

module "azurerm_kubernetes_cluster_extension" {
  source                           = "git::https://github.com/BrettOJ/tf-az-module-azure-kubernetes-cluster-extension?ref=main"
  cluster_id                       = var.cluster_id
  extension_type                   = var.extension_type
  release_train                    = var.release_train
  release_namespace                = var.release_namespace
  target_namespace                 = var.target_namespace
  version                          = var.version
  configuration_settings           = var.configuration_settings
  configuration_protected_settings = var.configuration_protected_settings
  tags                             = local.tags
  naming_convention_info           = local.naming_convention_info

  plan = {
    name           = var.plan_name
    product        = var.plan_product
    publisher      = var.plan_publisher
    promotion_code = var.plan_promotion_code
    version        = var.plan_version
  }

}

module "azure_kubernetes_flux_configuration" {
  source                            = "git::https://github.com/BrettOJ/tf-az-module-azure-flux-configuration?ref=main"
  cluster_id                        = var.cluster_id
  namespace                         = var.namespace
  scope                             = var.scope
  continuous_reconciliation_enabled = var.continuous_reconciliation_enabled

  kustomizations = {
    name                       = var.kustomizations_name
    path                       = var.kustomizations_path
    timeout_in_seconds         = var.kustomizations_timeout_in_seconds
    sync_interval_in_seconds   = var.kustomizations_sync_interval_in_seconds
    retry_interval_in_seconds  = var.kustomizations_retry_interval_in_seconds
    recreating_enabled         = var.kustomizations_recreating_enabled
    garbage_collection_enabled = var.kustomizations_garbage_collection_enabled
    depends_on                 = var.kustomizations_depends_on
  }

  blob_storage = {
    container_id         = var.blob_storage_container_id
    account_key          = var.blob_storage_account_key
    local_auth_reference = var.blob_storage_local_auth_reference
    managed_identity = {
      client_id = var.blob_storage_managed_identity_client_id
    }
    sas_token = var.blob_storage_sas_token
    service_principal = {
      client_id                     = var.blob_storage_service_principal_client_id
      tenant_id                     = var.blob_storage_service_principal_tenant_id
      client_certificate_base64     = var.blob_storage_service_principal_client_certificate_base64
      client_certificate_password   = var.blob_storage_service_principal_client_certificate_password
      client_certificate_send_chain = var.blob_storage_service_principal_client_certificate_send_chain
      client_secret                 = var.blob_storage_service_principal_client_secret
    }
    sync_interval_in_seconds = var.blob_storage_sync_interval_in_seconds
    timeout_in_seconds       = var.blob_storage_timeout_in_seconds
  }

  bucket = {
    bucket_name              = var.bucket_bucket_name
    url                      = var.bucket_url
    access_key               = var.bucket_access_key
    secret_key_base64        = var.bucket_secret_key_base64
    tls_enabled              = var.bucket_tls_enabled
    local_auth_reference     = var.bucket_local_auth_reference
    sync_interval_in_seconds = var.bucket_sync_interval_in_seconds
    timeout_in_seconds       = var.bucket_timeout_in_seconds
  }

  git_repository = {
    url                      = var.git_repository_url
    reference_type           = var.git_repository_reference_type
    reference_value          = var.git_repository_reference_value
    https_ca_cert_base64     = var.git_repository_https_ca_cert_base64
    https_user               = var.git_repository_https_user
    https_key_base64         = var.git_repository_https_key_base64
    local_auth_reference     = var.git_repository_local_auth_reference
    ssh_private_key_base64   = var.git_repository_ssh_private_key_base64
    ssh_known_hosts_base64   = var.git_repository_ssh_known_hosts_base64
    sync_interval_in_seconds = var.git_repository_sync_interval_in_seconds
    timeout_in_seconds       = var.git_repository_timeout_in_seconds
  }
  depends_on = [
    module.azure_kubernetes_cluster_extension
  ]
}
