output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}

### The Ansible inventory file to ansible dir
resource "local_file" "AnsibleInventoryYML" {
  content = templatefile("inventory.yml.tmpl",
    {
      app-ip = module.app.external_ip_address_app,
      db-ip  = module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/inventory.yml"
}

resource "local_file" "AnsibleInventoryJSON" {
  content = templatefile("inventory.json.tmpl",
    {
      app-ip = module.app.external_ip_address_app,
      db-ip  = module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/inventory.json"
}

