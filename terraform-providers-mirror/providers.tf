terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.68.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "3.8.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "6.40.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }

    databricks = {
      source  = "databricks/databricks"
      version = "1.112.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.8.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }

    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }

    external = {
      source  = "hashicorp/external"
      version = "2.3.5"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.13.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }

    vault = {
      source  = "hashicorp/vault"
      version = "5.8.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "3.1.1"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "2.7.1"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }

    tfmigrate = {
      source  = "hashicorp/tfmigrate"
      version = "2.0.0-rc1"
    }
  }
}