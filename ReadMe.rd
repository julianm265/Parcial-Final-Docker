# Servicio Telemático Contenerizado - Examen 3

## Descripción
Este proyecto implementa un servicio web escalable a nivel de producción, desplegado bajo el concepto de **Desarrollo Continuo** utilizando Docker y AWS.

## Requisitos
- Docker instalado en el servidor de producción (Ubuntu 22.04 LTS).
- Cuenta de GitHub para la trazabilidad del código.

## Guía de Despliegue (Paso a Paso)
1. **Clonación del repositorio:**
   `git clone https://github.com/julianm265/Parcial-Final-Docker.git`
2. **Construcción de la imagen (Automatización):**
   `cd Parcial-Final-Docker`
   `sudo docker build -t servicio-produccion .`
3. **Despliegue del contenedor:**
   `sudo docker run -d --name contenedor-web -p 80:80 servicio-produccion`

## Mantenimiento
Para realizar cambios, edite el archivo `index.html`, realice un `git push` desde su entorno local y un `git pull` en el servidor de producción antes de reconstruir la imagen.