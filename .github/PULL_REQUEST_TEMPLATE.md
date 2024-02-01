# Выполнено ДЗ Сборка образов VM при помощи Packer
 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Файлы [deploy.sh](../config-scripts/deploy.sh),
   [init.yaml](../config-scripts/init.yaml),
   [install_mongodb.sh](../config-scripts/install_mongodb.sh),
   [install_ruby.sh](../config-scripts/install_ruby.sh)
   перенесены в директорию [config-scripts](../config-scripts)
 - Создан сервисный аккаунт `packer-user` для Packer в Yandex.Cloud
 - Установлена роль edit аккаунту для Packer
 - Создан service account key file
 - Создан файл-шаблон Packer [ubuntu16.json](../packer/ubuntu16.json)
 - Создан файл-шаблон Packer [immutable.json](../packer/immutable.json)
 - Создан скрипт [create-reddit-vm.sh](../config-scripts/create-reddit-vm.sh) сборки ВМ на основе шаблона [immutable.json](../packer/immutable.json)

## Как запустить проект:
 - Собрать образ ВМ можно при помощи команды:
   ```text
      packer build -var-file variables.json immutable.json
    ```
 - Запустить сборку ВМ можно при помощи скрипта [create-reddit-vm.sh](../config-scripts/create-reddit-vm.sh) 
   или запустив команду:
   ```text
      yc compute instance create \
        --name reddit-app \
        --hostname reddit-app \
        --memory=2 \
        --create-boot-disk image-family=reddit-full,size=10GB \
        --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
        --metadata serial-port-enable=1 \
        --ssh-key ~/.ssh/appuser.pub
   ```
## Как проверить работоспособность:
 - После завершения сборки ВМ из шаблона [immutable.json](../packer/immutable.json)
   можео перейти по ссылке `http://<внешний IP машины>:9292`
  
## PR checklist
- [x] Файлы [deploy.sh](../config-scripts/deploy.sh),
  [init.yaml](../config-scripts/init.yaml),
  [install_mongodb.sh](../config-scripts/install_mongodb.sh),
  [install_ruby.sh](../config-scripts/install_ruby.sh)
  перенесены в директорию [config-scripts](../config-scripts)
- [x] Создан сервисный аккаунт `packer-user` для Packer в Yandex.Cloud
- [x] Установлена роль edit аккаунту для Packer
- [x] Создан service account key file
- [x] Создан файл-шаблон Packer [ubuntu16.json](../packer/ubuntu16.json)
- [x] Создан файл-шаблон Packer [immutable.json](../packer/immutable.json)
- [x] Создан скрипт [create-reddit-vm.sh](../config-scripts/create-reddit-vm.sh) сборки ВМ на основе шаблона [immutable.json](../packer/immutable.json)
