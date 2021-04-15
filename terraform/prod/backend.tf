terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-state-avoronovat"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "OB-7y-sVqaO5JsbRhnjy"
    secret_key = "lV-fumnrambX9BgsPDg3eG1gc5tETMJLyOnE1-JS"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
