FROM kartoza/postgis:9.6-2.4
VOLUME "/data"
RUN echo noooo
COPY ./entrypoint.sh /app
COPY ./data.sql /app

ENV POSTGRES_USER=gisuser
ENV POSTGRES_PASS=password
ENV POSTGRES_DBNAME=gis
ENV ALLOW_IP_RANGE=<0.0.0.0/0>
EXPOSE 5432

RUN chmod +x -R /app
RUN ls -a app
ENTRYPOINT ["app/entrypoint.sh"]
