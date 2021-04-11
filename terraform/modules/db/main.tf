resource "yandex_compute_instance" "db" {
  name = "reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
      type = "ssh"
      host = yandex_compute_instance.db.network_interface.0.nat_ip_address
      user  = "ubuntu"
      agent = false
      # путь до приватного ключа
      private_key = file("/root/.ssh/appuser")
    }

  provisioner "remote-exec" {
    inline = [
      "sudo grep '127.0.0.1' -P -R -I -l /etc/mongod.conf | sudo xargs sed -i 's/127.0.0.1/${yandex_compute_instance.db.network_interface.0.ip_address}/g'",
      "sudo systemctl stop mongod",
      "sudo systemctl start mongod"
    ]
  }

}
