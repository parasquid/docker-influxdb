FROM golang
MAINTAINER parasquid <tristan.gomez@gmail.com>

RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties

RUN curl -o ./influxdb_latest_amd64.deb http://s3.amazonaws.com/influxdb/influxdb_latest_amd64.deb
RUN dpkg -i influxdb_latest_amd64.deb

ADD influxdb.toml /etc/influxdb.toml

# Admin server
EXPOSE 8083

# HTTP API
EXPOSE 8086

# Graphite
EXPOSE 2003

# Raft port (for clustering, don't expose publicly!)
#EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
#EXPOSE 8099

VOLUME ["/influxdb_data"]

CMD /usr/bin/influxdb -config=/etc/influxdb.toml