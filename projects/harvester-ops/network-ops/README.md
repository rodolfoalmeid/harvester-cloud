# network-ops

This project contains two recipes:

1. [network-creation](./network-creation)
2. [detach-network-interface](./detach-network-interface)

## network-creation

The **network-creation** recipe allows you to:

1. Create a second Virtual Network on the VM in the cloud (default name: `vlan2`).
2. Connect the newly created Virtual Network to the Harvester nodes (which are nested VMs).
3. Using Harvester's Terraform Provider, create a VM Network on the Harvester cluster.

#### The process flow:

VM in the cloud > (libvirt) Virtual Network *vlan2* > (libvirt) Attach network interface > (libvirt) Reboot VMs > Harvester nodes > VM Network

## detach-network-interface

The recipe **detach-network-interface** allows you to:

1. Disconnect the network interface from the nested VMs (Harvester nodes).
2. Remove the *vlan2* virtual network from the cloud VM.

#### The process flow:

VM in the cloud > (libvirt) Detach network interface > (libvirt) Reboot VMs

**It was necessary to divide these activities into two recipes because Terraform does not manage the scripting part (in this case the libvirt commands) executed on the VM. For this reason the `terraform destroy` of network-creation resources does not detach the NIC.**
