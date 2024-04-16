FROM prom/prometheus:latest

VOLUME [ "/prometheus" ]
WORKDIR /prometheus
COPY config/prometheus.yml /etc/prometheus/prometheus.yml

ENTRYPOINT [ "/bin/prometheus" ]
CMD [ "--config.file=/etc/prometheus/prometheus.yml", \
      "--storage.tsdb.path=/prometheus", \
      "--web.console.libraries=/usr/share/prometheus/console_libraries", \
      "--web.console.templates=/usr/share/prometheus/consoles" ]

EXPOSE 9090

FROM grafana/grafana:latest

VOLUME [ "/var/lib/grafana", "/etc/grafana", "/var/log/grafana" ]
COPY config/grafana.ini /etc/grafana/grafana.ini

EXPOSE 3000

ENTRYPOINT [ "/run.sh" ]
