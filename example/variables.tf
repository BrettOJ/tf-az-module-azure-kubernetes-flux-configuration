variable "cluster_id" {
  description = "The ID of the cluster to reconcile."
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

variable "kustomizations_name" {
  description = "The name of the kustomization."
  type        = string
}

variable "kustomizations_path" {
  description = "The path to the kustomization."
  type        = string
}

variable "kustomizations_timeout_in_seconds" {
  description = "The timeout in seconds for the kustomization."
  type        = number
}

variable "kustomizations_sync_interval_in_seconds" {
  description = "The sync interval in seconds for the kustomization."
  type        = number
}

variable "kustomizations_retry_interval_in_seconds" {
  description = "The retry interval in seconds for the kustomization."
  type        = number
}

variable "kustomizations_recreating_enabled" {
  description = "Whether the kustomization will recreate resources. Defaults to false."
  type        = bool
  default     = false
}

variable "kustomizations_garbage_collection_enabled" {
  description = "Whether the kustomization will garbage collect resources. Defaults to false."
  type        = bool
  default     = false
}

variable "kustomizations_depends_on" {
  description = "The kustomizations that this kustomization depends on."
  type        = list(string)
}

variable "blob_storage_container_id" {
  description = "The ID of the Azure Blob storage container."
  type        = string
}

variable "blob_storage_account_key" {
  description = "The account key of the Azure Blob storage account."
  type        = string
}

variable "blob_storage_local_auth_reference" {
  description = "The local auth reference of the Azure Blob storage."
  type        = string
}

variable "blob_storage_managed_identity_client_id" {
  description = "The client ID of the managed identity for the Azure Blob storage."
  type        = string
}

variable "blob_storage_sas_token" {
  description = "The SAS token of the Azure Blob storage."
  type        = string
}

variable "blob_storage_service_principal_client_id" {
  description = "The client ID of the service principal for the Azure Blob storage."
  type        = string
}

variable "blob_storage_service_principal_tenant_id" {
  description = "The tenant ID of the service principal for the Azure Blob storage."
  type        = string
}

variable "blob_storage_service_principal_client_certificate_base64" {
  description = "The base64-encoded client certificate of the service principal for the Azure Blob storage."
  type        = string
}

variable "blob_storage_service_principal_client_certificate_password" {
  description = "The password of the client certificate of the service principal for the Azure Blob storage."
  type        = string
}

variable "blob_storage_service_principal_client_certificate_send_chain" {
  description = "Whether to send the certificate chain of the client certificate of the service principal for the Azure Blob storage."
  type        = bool
}

variable "blob_storage_service_principal_client_secret" {
  description = "The client secret of the service principal for the Azure Blob storage."
  type        = string
}

variable "blob_storage_sync_interval_in_seconds" {
  description = "The sync interval in seconds for the Azure Blob storage."
  type        = number
}

variable "blob_storage_timeout_in_seconds" {
  description = "The timeout in seconds for the Azure Blob storage."
  type        = number
}

variable "bucket_bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "bucket_url" {
  description = "The URL of the S3 bucket."
  type        = string
}

variable "bucket_access_key" {
  description = "The access key of the S3 bucket."
  type        = string
}

variable "bucket_secret_key_base64" {
  description = "The base64-encoded secret key of the S3 bucket."
  type        = string
}

variable "bucket_tls_enabled" {
  description = "Whether TLS is enabled for the S3 bucket. Defaults to false."
  type        = bool
}


variable "bucket_local_auth_reference" {
  description = "The local auth reference of the S3 bucket."
  type        = string
}

variable "bucket_sync_interval_in_seconds" {
  description = "The sync interval in seconds for the S3 bucket."
  type        = number
}

variable "bucket_timeout_in_seconds" {
  description = "The timeout in seconds for the S3 bucket."
  type        = number
}

variable "git_repository_url" {
  description = "The URL of the Git repository."
  type        = string
}

variable "git_repository_reference_type" {
  description = "The reference type of the Git repository."
  type        = string
}

variable "git_repository_reference_value" {
  description = "The reference value of the Git repository."
  type        = string
}

variable "git_repository_https_ca_cert_base64" {
  description = "The base64-encoded CA certificate of the Git repository."
  type        = string
}

variable "git_repository_https_user" {
  description = "The user of the Git repository."
  type        = string
}

variable "git_repository_https_key_base64" {
  description = "The base64-encoded key of the Git repository."
  type        = string
}

variable "git_repository_local_auth_reference" {
  description = "The local auth reference of the Git repository."
  type        = string
}

variable "git_repository_ssh_private_key_base64" {
  description = "The base64-encoded private key of the Git repository."
  type        = string
}

variable "git_repository_ssh_known_hosts_base64" {
  description = "The base64-encoded known hosts of the Git repository."
  type        = string
}

variable "git_repository_sync_interval_in_seconds" {
  description = "The sync interval in seconds for the Git repository."
  type        = number
}

variable "git_repository_timeout_in_seconds" {
  description = "The timeout in seconds for the Git repository."
  type        = number
}
