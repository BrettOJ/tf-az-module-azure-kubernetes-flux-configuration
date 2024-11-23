# tf-az-module-azure-kubernetes-flux-configuration
Terraform module to deploy an AKS flus configuration

Manages a Kubernetes Flux Configuration.

## [Example Usage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#example-usage)

```hcl
resource "azurerm_resource_group" "example" { name = "example-resources" location = "West Europe" } resource "azurerm_kubernetes_cluster" "example" { name = "example-aks" location = "West Europe" resource_group_name = azurerm_resource_group.example.name dns_prefix = "example-aks" default_node_pool { name = "default" node_count = 1 vm_size = "Standard_DS2_v2" } identity { type = "SystemAssigned" } } resource "azurerm_kubernetes_cluster_extension" "example" { name = "example-ext" cluster_id = azurerm_kubernetes_cluster.test.id extension_type = "microsoft.flux" } resource "azurerm_kubernetes_flux_configuration" "example" { name = "example-fc" cluster_id = azurerm_kubernetes_cluster.test.id namespace = "flux" git_repository { url = "https://github.com/Azure/arc-k8s-demo" reference_type = "branch" reference_value = "main" } kustomizations { name = "kustomization-1" } depends_on = [ azurerm_kubernetes_cluster_extension.example ] }
```

## [Arguments Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#arguments-reference)

The following arguments are supported:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#name-11) - (Required) Specifies the name which should be used for this Kubernetes Flux Configuration. Changing this forces a new Kubernetes Flux Configuration to be created.
    
-   [`cluster_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#cluster_id-6) - (Required) Specifies the Cluster ID. Changing this forces a new Kubernetes Cluster Extension to be created.
    
-   [`kustomizations`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#kustomizations-1) - (Required) A `kustomizations` block as defined below.
    
-   [`namespace`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#namespace-1) - (Required) Specifies the namespace to which this configuration is installed to. Changing this forces a new Kubernetes Flux Configuration to be created.
    
-   [`blob_storage`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#blob_storage-1) - (Optional) An `blob_storage` block as defined below.
    
-   [`bucket`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#bucket-1) - (Optional) A `bucket` block as defined below.
    
-   [`git_repository`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#git_repository-1) - (Optional) A `git_repository` block as defined below.
    
-   [`scope`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#scope-1) - (Optional) Specifies the scope at which the operator will be installed. Possible values are `cluster` and `namespace`. Defaults to `namespace`. Changing this forces a new Kubernetes Flux Configuration to be created.
    
-   [`continuous_reconciliation_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#continuous_reconciliation_enabled-1) - (Optional) Whether the configuration will keep its reconciliation of its kustomizations and sources with the repository. Defaults to `true`.
    

___

A `kustomizations` block supports the following:

-   [`name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#name-12) - (Required) Specifies the name of the kustomization.
    
-   [`path`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#path-1) - (Optional) Specifies the path in the source reference to reconcile on the cluster.
    
-   [`timeout_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#timeout_in_seconds-1) - (Optional) The maximum time to attempt to reconcile the kustomization on the cluster. Defaults to `600`.
    
-   [`sync_interval_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#sync_interval_in_seconds-1) - (Optional) The interval at which to re-reconcile the kustomization on the cluster. Defaults to `600`.
    
-   [`retry_interval_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#retry_interval_in_seconds-1) - (Optional) The interval at which to re-reconcile the kustomization on the cluster in the event of failure on reconciliation. Defaults to `600`.
    
-   [`recreating_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#recreating_enabled-1) - (Optional) Whether re-creating Kubernetes resources on the cluster is enabled when patching fails due to an immutable field change. Defaults to `false`.
    
-   [`garbage_collection_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#garbage_collection_enabled-1) - (Optional) Whether garbage collections of Kubernetes objects created by this kustomization is enabled. Defaults to `false`.
    
-   [`depends_on`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#depends_on-1) - (Optional) Specifies other kustomizations that this kustomization depends on. This kustomization will not reconcile until all dependencies have completed their reconciliation.
    

___

An `blob_storage` block supports the following:

-   [`container_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#container_id-1) - (Required) Specifies the Azure Blob container ID.
    
-   [`account_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#account_key-1) - (Optional) Specifies the account key (shared key) to access the storage account.
    
-   [`local_auth_reference`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#local_auth_reference-1) - (Optional) Specifies the name of a local secret on the Kubernetes cluster to use as the authentication secret rather than the managed or user-provided configuration secrets.
    
-   [`managed_identity`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#managed_identity-1) - (Optional) A `managed_identity` block as defined below.
    
-   [`sas_token`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#sas_token-1) - (Optional) Specifies the shared access token to access the storage container.
    
-   [`service_principal`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#service_principal-2) - (Optional) A `service_principal` block as defined below.
    
-   [`sync_interval_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#sync_interval_in_seconds-2) - (Optional) Specifies the interval at which to re-reconcile the cluster Azure Blob source with the remote.
    
-   [`timeout_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#timeout_in_seconds-2) - (Optional) Specifies the maximum time to attempt to reconcile the cluster Azure Blob source with the remote.
    

___

A `managed_identity` block supports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#client_id-10) - (Required) Specifies the client ID for authenticating a Managed Identity.

___

A `service_principal` block supports the following:

-   [`client_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#client_id-11) - (Required) Specifies the client ID for authenticating a Service Principal.
    
-   [`tenant_id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#tenant_id-9) - (Required) Specifies the tenant ID for authenticating a Service Principal.
    
-   [`client_certificate_base64`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#client_certificate_base64-1) - (Optional) Base64-encoded certificate used to authenticate a Service Principal .
    
-   [`client_certificate_password`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#client_certificate_password-2) - (Optional) Specifies the password for the certificate used to authenticate a Service Principal .
    
-   [`client_certificate_send_chain`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#client_certificate_send_chain-1) - (Optional) Specifies whether to include x5c header in client claims when acquiring a token to enable subject name / issuer based authentication for the client certificate.
    
-   [`client_secret`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#client_secret-3) - (Optional) Specifies the client secret for authenticating a Service Principal.
    

___

A `bucket` block supports the following:

-   [`bucket_name`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#bucket_name-1) - (Required) Specifies the bucket name to sync from the url endpoint for the flux configuration.
    
-   [`url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#url-1) - (Required) Specifies the URL to sync for the flux configuration S3 bucket. It must start with `http://` or `https://`.
    
-   [`access_key`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#access_key-1) - (Optional) Specifies the plaintext access key used to securely access the S3 bucket.
    
-   [`secret_key_base64`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#secret_key_base64-1) - (Optional) Specifies the Base64-encoded secret key used to authenticate with the bucket source.
    
-   [`tls_enabled`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#tls_enabled-1) - (Optional) Specify whether to communicate with a bucket using TLS is enabled. Defaults to `true`.
    
-   [`local_auth_reference`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#local_auth_reference-2) - (Optional) Specifies the name of a local secret on the Kubernetes cluster to use as the authentication secret rather than the managed or user-provided configuration secrets. It must be between 1 and 63 characters. It can contain only lowercase letters, numbers, and hyphens (-). It must start and end with a lowercase letter or number.
    
-   [`sync_interval_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#sync_interval_in_seconds-3) - (Optional) Specifies the interval at which to re-reconcile the cluster git repository source with the remote. Defaults to `600`.
    
-   [`timeout_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#timeout_in_seconds-3) - (Optional) Specifies the maximum time to attempt to reconcile the cluster git repository source with the remote. Defaults to `600`.
    

___

A `git_repository` block supports the following:

-   [`url`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#url-2) - (Required) Specifies the URL to sync for the flux configuration git repository. It must start with `http://`, `https://`, `git@` or `ssh://`.
    
-   [`reference_type`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#reference_type-1) - (Required) Specifies the source reference type for the GitRepository object. Possible values are `branch`, `commit`, `semver` and `tag`.
    
-   [`reference_value`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#reference_value-1) - (Required) Specifies the source reference value for the GitRepository object.
    
-   [`https_ca_cert_base64`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#https_ca_cert_base64-1) - (Optional) Specifies the Base64-encoded HTTPS certificate authority contents used to access git private git repositories over HTTPS.
    
-   [`https_user`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#https_user-1) - (Optional) Specifies the plaintext HTTPS username used to access private git repositories over HTTPS.
    
-   [`https_key_base64`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#https_key_base64-1) - (Optional) Specifies the Base64-encoded HTTPS personal access token or password that will be used to access the repository.
    
-   [`local_auth_reference`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#local_auth_reference-3) - (Optional) Specifies the name of a local secret on the Kubernetes cluster to use as the authentication secret rather than the managed or user-provided configuration secrets. It must be between 1 and 63 characters. It can contain only lowercase letters, numbers, and hyphens (-). It must start and end with a lowercase letter or number.
    
-   [`ssh_private_key_base64`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#ssh_private_key_base64-1) - (Optional) Specifies the Base64-encoded SSH private key in PEM format.
    
-   [`ssh_known_hosts_base64`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#ssh_known_hosts_base64-1) - (Optional) Specifies the Base64-encoded known\_hosts value containing public SSH keys required to access private git repositories over SSH.
    
-   [`sync_interval_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#sync_interval_in_seconds-4) - (Optional) Specifies the interval at which to re-reconcile the cluster git repository source with the remote. Defaults to `600`.
    
-   [`timeout_in_seconds`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#timeout_in_seconds-4) - (Optional) Specifies the maximum time to attempt to reconcile the cluster git repository source with the remote. Defaults to `600`.
    

## [Attributes Reference](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#attributes-reference)

In addition to the Arguments listed above - the following Attributes are exported:

-   [`id`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#id-8) - The ID of the Kubernetes Flux Configuration.

## [Timeouts](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#timeouts)

The `timeouts` block allows you to specify [timeouts](https://www.terraform.io/docs/configuration/resources.html#timeouts) for certain actions:

-   [`create`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#create-8) - (Defaults to 30 minutes) Used when creating the Kubernetes Flux Configuration.
-   [`read`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#read-8) - (Defaults to 5 minutes) Used when retrieving the Kubernetes Flux Configuration.
-   [`update`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#update-7) - (Defaults to 30 minutes) Used when updating the Kubernetes Flux Configuration.
-   [`delete`](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#delete-8) - (Defaults to 30 minutes) Used when deleting the Kubernetes Flux Configuration.

## [Import](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_extension#import)

Kubernetes Flux Configuration can be imported using the `resource id` for different `cluster_resource_name`, e.g.

```shell
terraform import azurerm_kubernetes_flux_configuration.example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/resourceGroup1/providers/Microsoft.ContainerService/managedClusters/cluster1/providers/Microsoft.KubernetesConfiguration/fluxConfigurations/fluxConfiguration1
```