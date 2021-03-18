# avoronovat_infra
avoronovat Infra repository
bastion_IP = 178.154.201.118
someinternalhost_IP = 10.130.0.12

подключние в одну строчку к машине за бастионом someinternalhost
ssh -i ~/.ssh/appuser -A -J appuser@178.154.201.118 appuser@10.130.0.12

подключние через alias
cat ~/.ssh/config 
Host bastion
   User appuser
   IdentityFile ~/.ssh/appuser
   HostName 178.154.201.118
Host someinternalhost
   User appuser
   IdentityFile ~/.ssh/appuser
   ProxyJump bastion
   HostName 10.130.0.12

