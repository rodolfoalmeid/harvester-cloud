# Terraform | Azure CLI - Preparatory steps

In order for Terraform to run operations on your behalf, you must [Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).

## Example

#### macOS installation and setup

```bash
brew update && brew install azure-cli
```


```bash
az login
```

##### If there are more than 1 subscription, run the following to select the correct subscription where to create infrastructure

```bash
az account set --subscription "subscription-id"
```