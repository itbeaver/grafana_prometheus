FROM prom/prometheus:latest
LABEL maintainer="Your Name <your.email@example.com>"

VOLUME [ "/prometheus" ]
WORKDIR /prometheus
COPY prometheus.yml /etc/prometheus/prometheus.yml

ENTRYPOINT [ "/bin/prometheus" ]
CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
      "--storage.tsdb.path=/prometheus", \
      "--web.console.libraries=/usr/share/prometheus/console_libraries", \
      "--web.console.templates=/usr/share/prometheus/consoles" ]

EXPOSE 9090

FROM grafana/grafana:latest
LABEL maintainer="Your Name <your.email@example.com>"

VOLUME [ "/var/lib/grafana", "/etc/grafana", "/var/log/grafana" ]

EXPOSE 3000

ENTRYPOINT [ "/run.sh" ]