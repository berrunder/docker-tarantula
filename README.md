Dockerized Tarantula
======================

Dockerfile to build [Tarantula Test Management Tool](https://github.com/prove/tarantula) container image and `docker-compose.yml` to run it with database.

Based on image [ome-docker/tarantula](https://github.com/ome/ome-docker/tree/master/tarantula) by [Open Microscopy Environment](https://github.com/ome). Mysql deployed in separate container.

Example
-------

Start image building by running `docker-compose up -d` and start tarantula (accessible on port 8081).

The first time the Tarantula image is run it will initialize a new database and configure itself using configuration values passed as environment variables (web address of installed Tarantula, admin email, SMTP server address, SMTP port, SMTP domain). On subsequent runs these environment variables will be ignored.

Note that tarantula takes several minutes to initialise due to a pre-compilation step.

To view the tarantula container logs connect to container: 

    docker exec -it containerid /bin/bash/bash
    $ tail -f /var/log/httpd/error_log
    $ tail -f /data/log/production.log
    $ tail -f /data/supervisor/tarantula---supervisor-*.log

Issues/RFEs
-----------

- Consider using the [official Passenger Docker image](https://github.com/phusion/passenger-docker)
- Provide some feedback to show when Tarantula has been initialised

