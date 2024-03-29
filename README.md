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

## Практика IaC с использованием Terraform использованием

В рамках задания был установлен [Terraform](https://www.terraform.io/), 
изучены его основные команды, изучены конфигурации `YC` для создание ВМ и запуска приложения,
создана ВМ и запущено приложение.

В рамках дополнительного задания был создан балансировщик нагрузки и созданы ВМ через параметр ресурса `count`.

## Принципы организации инфраструктурного кода инфраструктурного кода и работа над и работа над инфраструктурой в инфраструктурой в команде на примере команде на примере Terraform

В рамках урока конфигурационные файлы инфраструктуры были разбиты на отдельные файлы [app.tf](terraform/app.tf) и [db.tf](terraform/db.tf), 
Настроен конфигаруционный файл сети [vpc.tf](terraform/vpc.tf), 
изучена работа с модулями, сконфигурирован удаленный бекенд файл [backend.tf](terraform/stage/backend.tf) для хранения состояния [terraform.tfstate](terraform/stage/terraform.tfstate),
запущено приложение в реорганизованной инфраструктуре.

# Docker

## Технология контейнеризации. контейнеризации. Введение в Docker Введение в Docker

Знакомство с `Docker` и `Docker machine` для работы в облаке (`YC`).
В рамках задания был создан инстанс ВМ в `YC` и инициализирована докер хост система при помощи `Docker machine`, 
собран образ с приложением [reddit](https://github.com/express42/reddit.git) и запущен контейнер в облаке.

Локально был запущен контейнер на основе образа `ubuntu` и изучены основные команды `docker` (`run`, `ps`, `images`, `start`, `attach`, `exec`, `commit`, `inspect`, `kill`, `stop`, `system df`, `rm`, `rmi`)

Выполнен `push` образа `mariabzh/otus-reddit:1.0` с приложением [reddit](https://github.com/express42/reddit.git) в [Docker Hub](https://hub.docker.com/).
