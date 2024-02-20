# Выполнено ДЗ Практика IaC с использованием Terraform использованием
 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Создан и сконфигурирован файл [main.tf](../terraform/main.tf)
 - Создан и сконфигурирован файл [variables.tf](../terraform/variables.tf)
 - Создан и сконфигурирован файл [terraform.tfvars](../terraform/terraform.tfvars) 
   (в репозиторий - [terraform.tfvars.example](../terraform/terraform.tfvars.example))
 - Создан и сконфигурирован файл [outputs.tf](../terraform/outputs.tf)
 - Создан скрипт [deploy.sh](../terraform/files/deploy.sh)
 - Создан файл [puma.service](../terraform/files/puma.service)
 - Создан и настроен [yandex_lb_network_load_balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/lb_network_load_balancer) в [lb.tf](../terraform/lb.tf)
 - Дополнен [README.md](../README.md)

## Как запустить проект:
 - Из директории [terraform](../terraform) выполнить команду 
   ```text
      terraform apply -auto-approve
   ```

## Как проверить работоспособность:
 - Из директории [terraform](../terraform) выполнить команду
  ```text
     terraform apply -auto-approve
  ```
 - После создания ВМ приложение должно быть доступно по адресам:
   ```text
      external_ip_address_app:9292
      external_ip_address_lb:9292
   ```
   Значение `external_ip_address_app` и `external_ip_address_lb` переменных можно посмотреть, используя команду:
   ```text
      terraform output 
   ```
 - После выключения 1й из ВМ по адресу `external_ip_address_lb` приложение должно быть доступно
   
  
## PR checklist
  - [x] Создан и сконфигурирован файл [main.tf](../terraform/main.tf)
  - [x] Создан и сконфигурирован файл [variables.tf](../terraform/variables.tf)
  - [x] Создан и сконфигурирован файл [terraform.tfvars](../terraform/terraform.tfvars) (в репозиторий - [terraform.tfvars.example](../terraform/terraform.tfvars.example))
  - [x] Создан и сконфигурирован файл [outputs.tf](../terraform/outputs.tf)
  - [x] Создан скрипт [deploy.sh](../terraform/files/deploy.sh)
  - [x] Создан файл [puma.service](../terraform/files/puma.service)
  - [x] Создан и настроен [yandex_lb_network_load_balancer]() в [lb.tf](../terraform/lb.tf)
  - [x] Дополнен [README.md](../README.md)
