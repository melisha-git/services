FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update
RUN apk upgrade
RUN apk add sudo openrc vim wget supervisor telegraf grafana

RUN openrc
RUN touch /run/openrc/softlevel


COPY ./srcs/supervisor.conf /etc/supervisord.conf
COPY ./srcs/grafana.ini /etc/
COPY ./srcs/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY ./srcs/dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboards.yaml
COPY ./srcs/telegraf.conf /etc/
COPY ./srcs/default.json /usr/share/grafana/public/dashboards/
# RUN rm -rf /usr/share/grafana/public/dashboards/home.json
# RUN rm -rf /usr/share/grafana/public/dashboards/template_vars.json
COPY ./srcs/start.sh .
RUN chmod +x start.sh

EXPOSE 3000

CMD sh start.sh