FROM nginx:alpine

# Instalar OpenSSL para generar el certificado SSL autofirmado
RUN apk add --no-cache openssl

# Crear la carpeta para los certificados y generarlos (Válido por 365 días)
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=CO/ST=Antioquia/L=Medellin/O=UPB/OU=Telematica/CN=localhost"

# Copiar tu configuración personalizada de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar tu página web
COPY Index.html /usr/share/nginx/html/index.html

# Exponer el puerto de comunicación seguro
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
