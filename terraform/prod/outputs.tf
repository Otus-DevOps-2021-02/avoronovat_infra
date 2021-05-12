output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}
output "local_ip_address_db" {
  value = module.db.local_ip_address_db
}

### The Ansible inventory file to ansible dir
resource "local_file" "AnsibleInventoryYML" {
  content = templatefile("inventory.yml.tmpl",
    {
      app-ip = module.app.external_ip_address_app,
      db-ip  = module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/environments/prod/inventory.yml"
}

resource "local_file" "AnsibleInventoryJSON" {
  content = templatefile("inventory.json.tmpl",
    {
      app-ip = module.app.external_ip_address_app,
      db-ip  = module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/environments/prod/inventory.json"
}

resource "local_file" "AnsibleGroupVarsAPP" {
  content = templatefile("group_vars.app.tmpl",
    {
      db-local-ip = module.db.local_ip_address_db
    }
  )
  filename = "../../ansible/environments/prod/group_vars/app"
}
