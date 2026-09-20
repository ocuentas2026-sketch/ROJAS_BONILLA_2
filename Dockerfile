FROM tomcat:9.0-jdk17-temurin

# Limpiar aplicaciones por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar todo el contenido de tu proyecto a la carpeta ROOT
COPY ROJAS_BONILLA_2-1.0-SNAPSHOT* /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
