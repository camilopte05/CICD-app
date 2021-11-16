FROM nginx:alpine
COPY static /usr/share/nginx/html
LABEL maintainer = "juan_camilo.espinosa@uao.edu.co"
