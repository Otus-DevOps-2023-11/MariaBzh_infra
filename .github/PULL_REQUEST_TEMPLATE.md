# Выполнено ДЗ Технология контейнеризации. контейнеризации. Введение в Docker Введение в Docker
 - [x] Основное ДЗ
 - [] Задание со *

## В процессе сделано:
 - Создан файл [docker-1.log](../docker-monolith/docker-1.log) с выхлопом команды `docker images` после создания `image`
 - Созданы файлы конфигурации для создания `Docker` образа с приложением [reddit](https://github.com/express42/reddit.git):
   - [db_config](../docker-monolith/db_config)
   - [Dockerfile](../docker-monolith/Dockerfile)
   - [mongod.conf](../docker-monolith/mongod.conf)
   - [start.sh](../docker-monolith/start.sh)
 - Установлен `Docker machine` для работы с `Docker` в облаке `YC`
 - Cоздаст инстанс ВМ в `YC` и инициализирована докер хост система
 - Собран образ с приложением [reddit](https://github.com/express42/reddit.git) и запущен контейнер в облаке
 - Выполнен `push` образа `mariabzh/otus-reddit:1.0` с приложением [reddit](https://github.com/express42/reddit.git) в [Docker Hub](https://hub.docker.com/)

## Как запустить проект:
- Запустить контейнер из образа `mariabzh/otus-reddit:1.0`:
  ```text
     docker run --name reddit -d -p 9292:9292 mariabzh/otus-reddit:1.0
  ```

## Как проверить работоспособность:
 - После старта контейнера `reddit` приложение будет доступно по ссылке `http://localhost:9292/` 

Запустить контейнер можно так же на удаленной машине, например в `YC` с использованием `Docker machine`.
Необходимо создать ВМ в `YC` и инициализировать окружение `Docker`. 
  
## PR checklist
 - [x] Создан файл [docker-1.log](../docker-monolith/docker-1.log) с выхлопом команды `docker images` после создания `image`
 - [x] Созданы файлы конфигурации для создания `Docker` образа с приложением [reddit](https://github.com/express42/reddit.git):
 - [x] [db_config](../docker-monolith/db_config)
 - [x] [Dockerfile](../docker-monolith/Dockerfile)
 - [x] [mongod.conf](../docker-monolith/mongod.conf)
 - [x] [start.sh](../docker-monolith/start.sh)
 - [x] Установлен `Docker machine` для работы с `Docker` в облаке `YC`
 - [x] Cоздаст инстанс ВМ в `YC` и инициализирована докер хост система
 - [x] Собран образ с приложением [reddit](https://github.com/express42/reddit.git) и запущен контейнер в облаке
 - [x] Выполнен `push` образа `mariabzh/otus-reddit:1.0` с приложением [reddit](https://github.com/express42/reddit.git) в [Docker Hub](https://hub.docker.com/)
