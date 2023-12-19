# Выполнено ДЗ №

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Создана директория [.github](../.github)
 - В директорию [.github](../.github) добавлен файл [PULL_REQUEST_TEMPLATE.md](PULL_REQUEST_TEMPLATE.md)
 - Установлена утилита [pre-commit](https://pre-commit.com/)
 - В корень проекта добавлен файл [.pre-commit-config.yaml](../.pre-commit-config.yaml)
 - Создана директория [play-travis](../play-travis)
 - В директории [play-travis](../play-travis) добавлен файл [test.py](../play-travis/test.py)
 - В директории [.github](../.github) cоздана директория [workflows](workflows)
 - В директории [.github](../.github) добавлен файл [auto_assign.yml](auto_assign.yml)
 - В директории [workflows](workflows) добавлены файлы [auto_assign.yml](workflows/auto_assign.yml) и [run-tests.yml](workflows/run-tests.yml)
 - Починка теста [test.py](../play-travis/test.py)

## Как запустить проект:
 - Запустить файл [test.py](../play-travis/test.py) выполнив команду `python3 play-travis/test.py` (Python 3.x)

## Как проверить работоспособность:
 - Проверить pre-commit hook можно выполнив команды из корня проекта `git add .` и `git commit -m '<commit massega>'`
 - Проверка Github Actions в репозитории проекта во вкладке [Actions](https://github.com/Otus-DevOps-2023-11/MariaBzh_infra/actions)

## PR checklist
 - [x] Починен упавший воркфлоу
 - [x] Выставилен pull-request 'Play travis'
