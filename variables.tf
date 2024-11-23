variable "cluster_id" {
  description = "The ID of the Kubernetes Cluster."
  type        = string
}

variable "namespace" {
  description = "The namespace to which this configuration is installed to."
  type        = string

}

variable "scope" {
  description = "The scope at which the operator will be installed. Possible values are cluster and namespace. Defaults to namespace."
  type        = string
  default     = "namespace"
}

variable "continuous_reconciliation_enabled" {
  description = "Whether the configuration will keep its reconciliation of its kustomizations and sources with the repository. Defaults to true."
  type        = bool
  default     = true
}

variable "kustomizations" {
  description = "The kustomizations to reconcile on the cluster."
  type = list(object({
    name                       = string
    path                       = string
    timeout_in_seconds         = number
    sync_interval_in_seconds   = number
    retry_interval_in_seconds  = number
    recreating_enabled         = bool
    garbage_collection_enabled = bool
    depends_on                 = list(string)
  }))
}

variable "blob_storage" {
  description = "The Azure Blob storage configuration."
  type = object({
    container_id         = string
    account_key          = string
    local_auth_reference = string
    managed_identity = object({
      client_id = string
    })
    sas_token = string
    service_principal = object({
      client_id                     = string
      tenant_id                     = string
      client_certificate_base64     = string
      client_certificate_password   = string
      client_certificate_send_chain = bool
      client_secret                 = string
    })
    sync_interval_in_seconds = number
    timeout_in_seconds       = number
  })
}

variable "bucket" {
  description = "The S3 bucket configuration."
  type = object({
    bucket_name              = string
    url                      = string
    access_key               = string
    secret_key_base64        = string
    tls_enabled              = bool
    local_auth_reference     = string
    sync_interval_in_seconds = number
    timeout_in_seconds       = number
  })
}

variable "git_repository" {
  description = "The Git repository configuration."
  type = object({
    url                      = string
    reference_type           = string
    reference_value          = string
    https_ca_cert_base64     = string
    https_user               = string
    https_key_base64         = string
    local_auth_reference     = string
    ssh_private_key_base64   = string
    ssh_known_hosts_base64   = string
    sync_interval_in_seconds = number
    timeout_in_seconds       = number
  })
}

