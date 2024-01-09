# Meal Generator
## Because math is hard

Two approaches:
  CSV
  SQL

Who will win? Find out next time, on meal_gen Z

Instantiating SurrealQL server:
```bash
surreal start --log debug --user root --pass root memory
surreal sql

# IMPORT NAMESPACE:
surreal import --conn http://localhost:8000 --user root --pass root --ns meal_gen --db meal_gen meal_gen.surql
```
Instantiating MySQL Server in Docker:
```bash
docker run --hostname=d6692cb0cdbf --mac-address=02:42:ac:11:00:02 --env=MYSQL_ROOT_PASSWORD=root --env=MYSQL_USER=telemakos --env=MYSQL_PASSWORD=telemakos --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=GOSU_VERSION=1.16 --env=MYSQL_MAJOR=innovation --env=MYSQL_VERSION=8.1.0-1.el8 --env=MYSQL_SHELL_VERSION=8.0.34-1.el8 --volume=/var/lib/mysql -p 3306:3306 -p 33060:33060 --runtime=runc -d mysql:latest
```