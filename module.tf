resource "azurerm_kubernetes_flux_configuration" "flux_config" {
  name                              = module.flux_config_name.naming_convention_output[var.naming_convention_info.name].names.0
  cluster_id                        = var.cluster_id
  namespace                         = var.namespace
  scope                             = var.scope
  continuous_reconciliation_enabled = var.continuous_reconciliation_enabled

  kustomizations {
    name                       = var.kustomizations.name
    path                       = var.kustomizations.path
    timeout_in_seconds         = var.kustomizations.timeout_in_seconds
    sync_interval_in_seconds   = var.kustomizations.sync_interval_in_seconds
    retry_interval_in_seconds  = var.kustomizations.retry_interval_in_seconds
    recreating_enabled         = var.kustomizations.recreating_enabled
    garbage_collection_enabled = var.kustomizations.garbage_collection_enabled
    depends_on                 = var.kustomizations.depends_on
  }

  blob_storage {
    container_id         = var.blob_storage.container_id
    account_key          = var.blob_storage.account_key
    local_auth_reference = var.blob_storage.local_auth_reference
    managed_identity {
      client_id = var.blob_storage.managed_identity.client_id
    }
    sas_token = var.blob_storage.sas_token
    service_principal {
      client_id                     = var.blob_storage.service_principal.client_id
      tenant_id                     = var.blob_storage.service_principal.tenant_id
      client_certificate_base64     = var.blob_storage.service_principal.client_certificate_base64
      client_certificate_password   = var.blob_storage.service_principal.client_certificate_password
      client_certificate_send_chain = var.blob_storage.service_principal.client_certificate_send_chain
      client_secret                 = var.blob_storage.service_principal.client_secret
    }
    sync_interval_in_seconds = var.blob_storage.sync_interval_in_seconds
    timeout_in_seconds       = var.blob_storage.timeout_in_seconds
  }

  bucket {
    bucket_name              = var.bucket.bucket_name
    url                      = var.bucket.url
    access_key               = var.bucket.access_key
    secret_key_base64        = var.bucket.secret_key_base64
    tls_enabled              = var.bucket.tls_enabled
    local_auth_reference     = var.bucket.local_auth_reference
    sync_interval_in_seconds = var.bucket.sync_interval_in_seconds
    timeout_in_seconds       = var.bucket.timeout_in_seconds
  }

  git_repository {
    url                      = var.git_repository.url
    reference_type           = var.git_repository.reference_type
    reference_value          = var.git_repository.reference_value
    https_ca_cert_base64     = var.git_repository.https_ca_cert_base64
    https_user               = var.git_repository.https_user
    https_key_base64         = var.git_repository.https_key_base64
    local_auth_reference     = var.git_repository.local_auth_reference
    ssh_private_key_base64   = var.git_repository.ssh_private_key_base64
    ssh_known_hosts_base64   = var.git_repository.ssh_known_hosts_base64
    sync_interval_in_seconds = var.git_repository.sync_interval_in_seconds
    timeout_in_seconds       = var.git_repository.timeout_in_seconds
  }
}

