#!/bin/bash

#docker volume create data
#docker run --name=posttest -d -e POSTGRES_USER=gisuser -e POSTGRES_PASS=password -e POSTGRES_DBNAME=gis -e ALLOW_IP_RANGE=0.0.0.0/0 \
#-p 5432:5432 -v pg_data:/var/lib/postgresql --restart=always kartoza/postgis:9.6-2.4

if [ ! "$(docker ps -q -f name=postgis)" ]; then
	    if [ "$(docker ps -aq -f status=exited -f name=postgis)" ]; then
		            # cleanup
			            docker rm postgis
				        fi
					    # run your container
					        docker run --name=postgis --network=host -d -e POSTGRES_USER=gisuser -e POSTGRES_PASS=password -e \
					       	POSTGRES_DBNAME=gis -e ALLOW_IP_RANGE=0.0.0.0/0 \
						-p 5432:5432 -v pg_data:/var/lib/postgresql --restart=always kartoza/postgis:9.6-2.4
						echo "running after reset"			
					fi

sleep 5

psql -h localhost -U gisuser gis < data.sql
