docker-influxdb
==================

Docker container for InfluxDB

Creates a docker image to run the InfluxDB application.


Install the upstart script in /etc/init

NOTE: make sure that docker is run with " -r= false " so it doesn't restart previously running containers

    sudo sh -c "echo 'DOCKER_OPTS=\"-r=false\"' >> /etc/default/docker"

Then create the container (and optionally run it)

    docker build -t docker-influxdb https://github.com/parasquid/docker-influxdb.git
    docker run -d -P -p 8083 -p 2003 --expose 8090 --expose 8099 docker-influxdb
