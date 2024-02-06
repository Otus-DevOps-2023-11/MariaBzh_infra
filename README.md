# MariaBzh_infra
MariaBzh Infra repository

# Облачная инфраструктура Yandex.Cloud

## ВМ

``` text
bastion_IP = 158.160.63.14
someinternalhost_IP = 10.128.0.15
```

### Подключение к someinternalhost через bastion

Подключиться к `someinternalhost` в одну строку через `bastion` можно при помощи команды:
``` text
ssh -i ~/.ssh/appuser -A -J appuser@158.160.63.14 appuser@10.128.0.15
```

### Алиас ssh someinternalhost

Создать/изменить файл `~/.ssh/config`, добавив строки:
```text
Host bastion
	HostName 158.160.63.14
	User appuser
	IdentityFile ~/.ssh/appuser

Host someinternalhost
	HostName 10.128.0.15
	User appuser
	IdentityFile ~/.ssh/appuser
	ProxyCommand ssh -W %h:%p bastion
```

Теперь можно выполнить команду:
``` text
ssh someinternalhost
```

## VPN

На `bastion` развернут Printunl VPN-сервер: https://158.160.63.14/#/dashboard
(логин и пароль дефолтные).

При помощи сервиса [nip.io](https://nip.io/) можно решить проблему с самоподписанным сертификатом:
домен вида `158.160.63.14.nip.io` переадресует на `158.160.63.14`

# Деплой тестового приложениā

```text
testapp_IP = 158.160.63.133
testapp_port = 9292
```

Команда для запуска создания образа с конфигурацией [init.yaml](config-scripts/init.yaml):
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
| Флаг                | Описание                                        |
|---------------------|-------------------------------------------------|
| name                | Наименование инстанса                           |
| hostname            | Имя хоста                                       |
| cores               | Кол-во ядер ЦП                                  |
| memory              | Память                                          |
| create-boot-disk    | Создание загрухочного дика с параметрами        |
| network-interface   | Сетевой интерфейс                               |
| metadata            | Список ключей для обработки                     |
| metadata-from-file  | Список ключей для обработки из указанного файла |

## Сборка образов VM при помощи Packer помощи Packer

Сервисный аккаунт `packer-user` с ролью `edit`

Файл-шаблон Packer [ubuntu16.json](./packer/ubuntu16.json) - содержит описание образа VM
с `ruby` и `mongodb`

Файл-шаблон Packer [immutable.json](./packer/immutable.json) - содержит описание образа VM
с `ruby`, `mongodb` и приложением `reddit`

Cкрипт [create-reddit-vm.sh](./config-scripts/create-reddit-vm.sh) - создает VM на основании
шаблона Packer [immutable.json](./packer/immutable.json)
