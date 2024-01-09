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