#!/bin/bash

yc compute instance create \
--name reddit-app-auto \
--hostname reddit-app-auto \
--memory=2 \
--create-boot-disk image-folder-id=b1g593l2rokl9tfe4k8i,image-family=reddit-full,size=10GB \
--network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
--metadata serial-port-enable=1 \
--ssh-key ~/.ssh/appuser.pub
