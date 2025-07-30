Данный проект представляет собой отчет о проделанных заданиях в рамках изучения Docker.

## Part 1. Готовый докер

- взяла официальный докер-образ с **nginx** и выкачала его при помощи `docker pull`
<br>![docker pull screenshot](screenshots/docker_pull.png)
- Проверь наличие докер-образа через `docker images`
<br>![docker image screenshot](screenshots/docker_image.png)
- Запусти докер-образ через `docker run -d [image_id|repository]`
<br>![docker image and run screenshot](screenshots/docker_image_and_run.png)
- Проверь, что образ запустился через `docker ps`
<br>![docker ps start screenshot](screenshots/docker_ps_start.png)
- Посмотри информацию о контейнере через `docker inspect [container_id|container_name]`
<br>![docker inspect screenshot](screenshots/docker_inspect.png)
<br>![docker inspect grep screenshot](screenshots/docker_inspect_grep.png)
<br>размер контейнера 67108864
<br>список замапленных портов 80/tcp
<br>ip контейнера 127.17.0.2
<br>

- Останови докер образ через `docker stop [container_id|container_name]`
<br>![docker stop screenshot](screenshots/docker_stop.png)
- Проверь, что образ остановился через `docker ps`
<br>![docker stop and ps screenshot](screenshots/docker_stop_and_ps.png)
- Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*
<br>![docker run ports and ps screenshot](screenshots/docker_run_ports_and_ps.png)
- Проверь, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
<br>![localhost 80 screenshot](screenshots/localhost_80.png)
- Перезапусти докер контейнер через `docker restart [container_id|container_name]`и проверь любым способом, что контейнер запустился
<br>![docker run ports and ps screenshot](screenshots/docker_restart_and_ps.png)

## Part 2. Операции с контейнером

- Прочитай конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*
<br>![docker nginx conf screenshot](screenshots/nginx_conf.png)
- Создай на локальной машине файл *nginx.conf*
<br>![docker touch nginx conf screenshot](screenshots/touch_nginx_conf.png)
- Настрой в нем по пути */status* отдачу страницы статуса сервера **nginx**
<br>![docker my nginx conf screenshot](screenshots/my_nginx_conf.png)
- Скопируй созданный файл *nginx.conf* внутрь докер-образа через команду `docker cp`
<br>![docker cp nginx conf screenshot](screenshots/docker_cp_nginx_conf.png)
- Перезапусти **nginx** внутри докер-образа через команду *exec*
<br>![docker nginx reload screenshot](screenshots/nginx_reload.png)
- Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
<br>![localhost status screenshot](screenshots/localhost_status.png)
- Экспортируй контейнер в файл *container.tar* через команду *export*
<br>![docker export screenshot](screenshots/docker_export.png)
- Останови контейнер
<br>![docker stop part 2 screenshot](screenshots/docker_stop_part2.png)
- Удали образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры
<br>![docker rmi screenshot](screenshots/docker_rmi.png)
- Удали остановленный контейнер
<br>![docker rm screenshot](screenshots/docker_rm.png)
- Импортируй контейнер обратно через команду *import*
<br>![docker import screenshot](screenshots/docker_import.png)
- Запусти импортированный контейнер
<br>![docker run imported container screenshot](screenshots/docker_run_imported_container.png)
- Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
<br>![localhost status imported screenshot](screenshots/localhost_status_imported.png)

## Part 3. Мини веб-сервер

- Напиши мини-сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`
<br>![hello screenshot](screenshots/hello.png)
- Запусти написанный мини-сервер через *spawn-fcgi* на порту 8080:
<br> 1) скопировала файлы в docker образ командами, потом открыла оболочку
<br>![docker setup part 3 screenshot](screenshots/docker_setup_part3.png)
<br> 2) установила gcc spawn-fcgi и libfcgi-dev внутрь образа предварительно выполнив команду `apt-get update`
<br>![install gcc spawn-fcgi libfcgi-dev screenshot](screenshots/install_gcc_spawn-fcgi_libfcgi-dev.png)
<br> 3) скомпилировала файл hello.c и запустила написанный мини-сервер через spawn-fcgi на порту 8080
<br>![compile hello spawn-fcgi 8080 screenshot](screenshots/compile_hello_spawn-fcgi_8080.png)
- Напиши свой *nginx.conf*, который будет проксировать все запросы с 81 порта на *127.0.0.1:8080*
<br>![nginx conf part3 screenshot](screenshots/nginx_conf_part3.png)
- Проверь, что в браузере по *localhost:81* отдается написанная тобой страничка
<br>![localhost 81 screenshot](screenshots/localhost_81.png)
