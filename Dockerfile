FROM tomcat:9.0-jdk17-temurin

# 1. Limpiar aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# 2. Crear el directorio ROOT limpio
RUN mkdir -p /usr/local/tomcat/webapps/ROOT

# 3. Copiar todo el contenido del repositorio
COPY . /tmp/build/

# 4. Buscar recursivamente dónde quedó el index.jsp y copiar sus archivos directamente a ROOT
RUN find /tmp/build -name "index.jsp" -exec cp {} /usr/local/tomcat/webapps/ROOT/ \; && \
    find /tmp/build -type d -name "css" -exec cp -r {} /usr/local/tomcat/webapps/ROOT/ \; && \
    find /tmp/build -type d -name "js" -exec cp -r {} /usr/local/tomcat/webapps/ROOT/ \; && \
    rm -rf /tmp/build

# 5. Desactivar el puerto de apagado innecesario
RUN sed -i 's/port="8005" shutdown="SHUTDOWN"/port="-1" shutdown="SHUTDOWN"/g' /usr/local/tomcat/conf/server.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]
