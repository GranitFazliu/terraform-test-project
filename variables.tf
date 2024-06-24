variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "solabaksResourceGroup"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "solaboratestorageacc"
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
  default     = "tfstate"
}

variable "kubernetes_cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
  default     = "aksCluster"
}

variable "dns_prefix" {
  description = "The DNS prefix for the Kubernetes cluster"
  type        = string
  default     = "akscluster"
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "The size of the virtual machines"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "environment" {
  description = "The environment tag"
  type        = string
  default     = "Development"
}
