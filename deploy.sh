# docker build -t backend GIS_tutorial_backend/.
# docker build -t webapp web_app/.
#
# docker run -it --network=host backend
# docker run -it --network=host webapp
#
docker-compose down
docker-compose up
