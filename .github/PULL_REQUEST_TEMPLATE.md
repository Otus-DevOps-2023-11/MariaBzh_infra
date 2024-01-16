# Выполнено ДЗ Деплой тестового приложениā
 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Файлы [cloud-bastion.ovpn](../VPN/cloud-bastion.ovpn) и [setupvpn.sh](../VPN/setupvpn.sh) 
   были перенесены в папку [VPN](../VPN)
 - Был установлен и инициализирован настроен `yc CLI`
 - При помощи `CLI` был создан инстанс `reddit-app`
 - Установлен `Ruby` и `Bundler`
 - Установлена `MongoDB`
 - Установлен `git`
 - Скачено приложение [reddit](https://github.com/express42/reddit/tree/monolith) при помощи команды `git clone`
 - Проверена работоспособность приложения
 - Сформирован скрипт [install_ruby.sh](../install_ruby.sh) по установке `Ruby`
 - Сформирован скрипт [install_mongodb.sh](../install_mongodb.sh) по установке `MongoDB`
 - Сформирован скрипт [deploy.sh](../deploy.sh) по скачиванию кода [reddit](https://github.com/express42/reddit/tree/monolith), установки
   зависимостей через `bundler` и запуску приложения
 - Сформирован [startup.yaml](../init.yaml) скрипт, который будет запускаться при создании инстанса
 - Дополнен файл [README.md](../README.md)

## Как запустить проект:
- Команда для запуска создания образа с конфигурацией [init.yaml](../init.yaml):
  ```text
  yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --cores 2 \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./init.yaml
  ```

## Как проверить работоспособность:
- Подключится к инстансу `reddit-app` можно при помощи команды
  ```text
  ssh -i ~/.ssh/appuser appuser@$PUBLIC_IP_ADDRESS
  ```
- Приложение будет доступно по адресу `http:\\$PUBLIC_IP_ADDRESS:$PORT`.    
  Порт можно получить выполнив команду
  ```text
  ps aux | grep puma
  ```
  или
  ```text
  ps -e -o command | grep -a puma | head -1
  ```
  
## PR checklist
- [x] Код из прошлого задания перенесен в указанные папки
- [x] Выполнена установка и настройка `yc CLI`
- [x] Выполнена инициализация инстанса `reddit-app` при помощи `CLI`
- [x] Выполнена установка необходимых пакетов в ручную:
  - `Ruby` и `Bundler`
  - `MongoDB`
  - `git`
- [x] Скачено, развернуто и запущено приложение [reddit](https://github.com/express42/reddit/tree/monolith)
- [x] Сформированы скрипты для установки необходимых пакетов:
  - [install_ruby.sh](../install_ruby.sh)
  - [install_mongodb.sh](../install_mongodb.sh)
- [x] Сформирован скрипт для скачевания и запуска приложения:
  - [deploy.sh](../deploy.sh)
- [x] Сформирован конфиг [init.yaml](../init.yaml) для автоматического развертывания и запуска приложения при создании инстанса `reddit-app`
