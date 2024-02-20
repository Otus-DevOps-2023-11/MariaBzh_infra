# Выполнено ДЗ Принципы организации инфраструктурного кода инфраструктурного кода и работа над и работа над инфраструктурой в инфраструктурой в команде на примере команде на примере Terraform
 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Конфигурация разбита по файлам [app.tf](../terraform/app.tf) и [db.tf](../terraform/db.tf)
 - Настроен конфигаруционный файл сети [vpc.tf](../terraform/vpc.tf)
 - Созданы модули [app](../terraform/modules/app) и [db](../terraform/modules/db)
 - Создана инфраструкура для окружений [stage](../terraform/stage) и [prod](../terraform/prod)
 - Напроен удаленный бекенд [backend.tf](../terraform/stage/backend.tf) для хранения [terraform.tfstate](../terraform/stage/terraform.tfstate)
 - Запущено приложение с передачей переменной окружения `DATABASE_URL`
 - Отредактирован файл [README.md](../README.md)

## Как запустить проект:
- Собрать необходимые образы ВМ можно из директории [packer](../packer) при помощи команд:
  ```text
     packer build -var-file variables.json db.json
   ```
  ```text
     packer build -var-file variables.json app.json
   ```
 - Из директории [terraform](../terraform/stage) или [terraform](../terraform/prod) выполнить команду
  ```text
     terraform apply -auto-approve
  ```
 - После создания ВМ приложение должно быть доступно по адресу:
 ```text
    external_ip_address_app:9292
 ```
 Значение `external_ip_address_app` переменной можно посмотреть, используя команду:
 ```text
    terraform output 
 ```

## Как проверить работоспособность:
 - Из директории [terraform](../terraform/stage) или [terraform](../terraform/prod) выполнить команду
   ```text
      terraform apply -auto-approve
   ```
  - После создания ВМ приложение должно быть доступно по адресу:
 ```text
    external_ip_address_app:9292
 ```
Значение `external_ip_address_app` переменной можно посмотреть, используя команду:
 ```text
    terraform output 
 ```
  
## PR checklist
 - [x] Конфигурация разбита по файлам [app.tf](../terraform/app.tf) и [db.tf](../terraform/db.tf)
 - [x] Настроен конфигаруционный файл сети [vpc.tf](../terraform/vpc.tf)
 - [x] Созданы модули [app](../terraform/modules/app) и [db](../terraform/modules/db)
 - [x] Создана инфраструкура для окружений [stage](../terraform/stage) и [prod](../terraform/prod)
 - [x] Напроен удаленный бекенд [backend.tf](../terraform/stage/backend.tf) для хранения [terraform.tfstate](../terraform/stage/terraform.tfstate)
 - [x] Запущено приложение с передачей переменной окружения `DATABASE_URL`
 - [x] Отредактирован файл [README.md](../README.md) 
