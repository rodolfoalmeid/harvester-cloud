output "public_ssh_key" {
  value = var.create_ssh_key_pair ? tls_private_key.ssh_private_key[0].public_key_openssh : null
}

output "instances_public_ip" {
  value       = digitalocean_droplet.nodes[*].ipv4_address
  description = "DigitalOcean Virtual Machines Public IPs"
}

