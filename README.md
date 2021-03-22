# avoronovat_infra
avoronovat Infra repository
bastion_IP = 178.154.201.118
someinternalhost_IP = 10.130.0.12
testapp_IP = 130.193.37.132
testapp_port = 9292

доп. задание - создание инстанса с приложением
скрипты для инстала и деплоя выложены на гист
https://gist.github.com/avoronovat/0e695a7a3b7523455cdd785c682bc51a
и запускается командой ( !переделано скрипты из гист не используются, все через метадата )

yc compute instance create \
    --name reddit-app-auto \
    --hostname reddit-app-auto \
    --memory=2 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604,size=10GB \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
    --metadata serial-port-enable=1 \
    --metadata-from-file user-data=./metadata_app.yaml
