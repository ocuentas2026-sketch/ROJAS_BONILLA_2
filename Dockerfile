FROM tomcat:9.0-jdk17-temurin

# Limpiar las aplicaciones por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Crear la carpeta principal ROOT
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# Copiar index.jsp
COPY index.jsp /usr/local/tomcat/webapps/ROOT/

# Copiar las carpetas css y js
COPY css /usr/local/tomcat/webapps/ROOT/css
COPY js /usr/local/tomcat/webapps/ROOT/js

EXPOSE 8080
CMD ["catalina.sh", "run"]
