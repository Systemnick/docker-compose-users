# docker-compose-users

## Список сервисов

- **Nginx** - балансировщик HTTP-запросов.
- **user-service** - сервис, позволяющий регистрировать и аутентифицировать пользователей.
- **PostgreSQL** - база даных для хранения персистентных данных.
- **cadvisor** - сборщик метрик от docker-контейнеров.
- **fluent-bit** - сборщик логов.

## Конфигурация

- **DATABASE_PASSWORD** - пароль для пользователя БД.
- **DATABASE_URL** - URL для подключения к БД.
- **LOG_LEVEL** - уровень логирования.
- **HTTP_ENDPOINT** - локальный адрес и порт, которые занимает **user-service**.

## Запуск

```bash
env $(cat .env | grep ^[A-Z] | xargs) docker stack deploy users --compose-file docker-compose.yml
```
