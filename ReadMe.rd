# Servicio Telemático Contenerizado - Examen 3

## Descripción
Este proyecto implementa un servicio web escalable a nivel de producción, desplegado bajo el concepto de **Desarrollo Continuo** utilizando Docker y AWS.

## Requisitos
- Docker instalado en el servidor de producción (Ubuntu 22.04 LTS).
- Cuenta de GitHub para la trazabilidad del código.

## Guía de Despliegue (Paso a Paso)
1. **Clonación del repositorio:**
   `git clone https://github.com/tu-usuario/nombre-repo.git`
2. **Construcción de la imagen (Automatización):**
   `docker build -t servicio-parcial-final .`
3. **Despliegue del contenedor:**
   `docker run -d --name produccion-web -p 80:80 servicio-parcial-final`

## Mantenimiento
Para realizar cambios, edite el archivo `index.html`, realice un `git push` desde su entorno local y un `git pull` en el servidor de producción antes de reconstruir la imagen.