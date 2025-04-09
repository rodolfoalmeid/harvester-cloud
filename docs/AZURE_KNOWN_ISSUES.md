# Microsoft Azure known issues

Collection of issues found or potentially occurring on the provider, unrelated to repository code (with workarounds where applicable).

## Error during infrastructure destruction: the VM is not powered off (pre-deletion step) because it is in a "deallocated" or "to be deallocated" state

#### ERROR

```console
╷
│ Error: powering off Windows Virtual Machine (Subscription: "<SUBSCRIPTION_ID>"
│ Resource Group Name: "<RESOURCE_GROUP_NAME>"
│ Virtual Machine Name: "<VIRTUAL_MACHINE_NAME>"): performing PowerOff: unexpected status 409 (409 Conflict) with error: OperationNotAllowed: Operation 'powerOff' is not allowed on VM '<VIRTUAL_MACHINE_NAME>' since the VM is either deallocated or marked to be deallocated. Please refer to https://aka.ms/vmpowerstates  to learn about different VM power states.
│
│
╵
```

The error is quite self-explanatory: the VM is in a state that prevents its destruction, causing the infrastructure deletion workflow to stop.

A VM can enter a *deallocated* state for various reasons, such as a shutdown initiated via the Azure Portal, CLI, or PowerShell; an automatic shutdown due to Spot VM behavior; an issue with the underlying physical host; and so on.
The *to be deallocated* state typically precedes *deallocated* and indicates that the shutdown process has been triggered but not yet completed.

#### WORKAROUND

1. Terraform

- Edit the Terraform provider as follows:

```console
...
...
...

provider "azurerm" {
  features {
    virtual_machine {
      skip_shutdown_and_force_delete = true
    }
  }
  subscription_id = var.subscription_id
}

...
...
...
```

- Run the destroy command

2. CLI

- Check the actual state of the VM

```bash
az vm get-instance-view --name <VIRTUAL_MACHINE_NAME> --resource-group <RESOURCE_GROUP_NAME> --query instanceView.statuses
```

Output:

```console
...
...
...
[
  {
    "code": "PowerState/deallocated",
    "displayStatus": "VM deallocated"
  }
]
...
...
...
```

- Force *deallocate* (if stuck in *to be deallocated*)

```bash
az vm deallocate --name <VIRTUAL_MACHINE_NAME> --resource-group <RESOURCE_GROUP_NAME>
```

- Run the destroy command

```bash
az vm delete --name <VIRTUAL_MACHINE_NAME> --resource-group <RESOURCE_GROUP_NAME> --yes
```

- If it still fails, check dependencies and blocks

```bash
az lock list --resource-group <RESOURCE_GROUP_NAME> --output table
```

3. Azure Portal: Delete resources manually
