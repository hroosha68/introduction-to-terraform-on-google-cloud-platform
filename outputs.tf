output "qa-ip" {
  value = module.qa.public_ip
}

output "staging-ip" {
  value = module.staging.public_ip
}

output "prod-ip" {
  value = module.prod.public_ip
}