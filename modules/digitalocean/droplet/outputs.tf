output "public_ssh_key" {
  description = "Public SSH key generated if a new key pair is created."
  value       = var.create_ssh_key_pair ? tls_private_key.ssh_private_key[0].public_key_openssh : null
}

output "instances_public_ip" {
  description = "Public IP addresses of the DigitalOcean Droplets."
  value       = digitalocean_droplet.nodes[*].ipv4_address
}
