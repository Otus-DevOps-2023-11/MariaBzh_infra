# Выполнено ДЗ Знакомство с облачной инфраструктурой Yandex.Cloud
 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Создана учетная запись в Yandex.Cloud
 - Создан каталог infra
 - Сгенерированы пары ключей при помощи утилиты `ssh-keygen`
 - Созданы в веб-интерфейсе инстансов две ВМ:
   - `bastion`
   - `someinternalhost` (без публичного адреса)
 - Выполнено подключение к ним по SSH:
   - из локальной консоли по публичному IPv4
   - сквозное подклечение через bastion (SSH Agent Forwarding)
 - На bastion выполнена установка 
 - Установлен pritunl на bastion, запущен и настроен, поднят vpn сервер через интерфейс
 - Создана организация, пользователь, сервер (сервер привязан к организации)
 - Скачен файл конфигурации *.ovpn
 - Установлен клиент OpenVPN, импортирован файл *.ovpn
 - Подключен VPN (логин, пароль, PIN поользователя)
 - Сформирован README.md

## Как запустить проект:
- Подключиться к `bastion` можно при помощи команды:
  ``` text
  ssh -i ~/.ssh/appuser appuser@158.160.63.14
  ```
- Подключиться к `someinternalhost` в одну строку через `bastion` можно при помощи команды:
  ``` text
  ssh -i ~/.ssh/appuser -A -J appuser@158.160.63.14 appuser@10.128.0.15
  ```
  (Предварителбно нужно добавить приватный ключ в ssh агент авторизации: `ssh-add ~/.ssh/appuser`)
- Подключиться к `someinternalhost` в одну строку через `bastion` можно через алиас: `ssh someinternalhost`
- На сервере bastion установлены и запущены `pritunl` и `mongod` (см. [setupvpn.sh](../vpn/setupvpn.sh)) Установить клиент OpenVPN и импортировать файл конфигурации [otus_test_vpn-server.ovpn](../vpn/otus_test_vpn-server.ovpn).
  После подключения к VPN подключится к `someinternalhost` можно будет по внутреннемуу IP:
  ``` text
  ssh -i ~/.ssh/appuser appuser@10.128.0.15
  ```

## Как проверить работоспособность:
- Подключиться к `bastion` можно при помощи команды:
  `ssh -t -i ~/.ssh/appuser appuser@158.160.63.14`
- Подключиться к `someinternalhost` в одну строку через `bastion` можно при помощи команды:
  `ssh -t -i ~/.ssh/appuser -A appuser@158.160.63.14 ssh appuser@10.128.0.15`
  (Предварителбно нужно добавить приватный ключ в ssh агент авторизации: `ssh-add ~/.ssh/appuser`)
- Подключиться к `someinternalhost` в одну строку через `bastion` можно через алиас: `ssh someinternalhost`
- Установить клиент OpenVPN и импортировать файл конфигурации [otus_test_vpn-server.ovpn](../vpn/otus_test_vpn-server.ovpn).
  После подключения к VPN-сети подключится к `someinternalhost` можно будет по внутреннему IP:
  ``` text
  ssh -i ~/.ssh/appuser appuser@10.128.0.15
  ```

## PR checklist
- [x] создана ВМ с публичным IP (`bastion`)
- [x] создана ВМ без публичного IP (`someinternalhost`)
- [x] выполнено подключение с локальной машины на `bastion`
- [x] выполнено подключение с `bastion` на `someinternalhost` при помощи SSH Agent Forwarding
- [x] сфоормирован alias для подключеения к `someinternalhost`
- [x] поднят VPN сервер на `bastion` (Pritunl)
- [x] сгенерирована конфигурация VPN-клиента
- [x] выполнено подключение к VPN-сети
- [x] проверен доступ по VPN-сети к `someinternalhost` по внутреннему IP