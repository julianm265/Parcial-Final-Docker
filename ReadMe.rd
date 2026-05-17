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
Para realizar cambios, edite el archivo `Index.html`, realice un `git push` desde su entorno local y un `git pull` en el servidor de producción antes de reconstruir la imagen.



# Documentación de Proyecto

## 1. Resumen Ejecutivo
Este proyecto comprende el diseño, configuración y despliegue de un servicio telemático interactivo y seguro en un entorno de computación en la nube. La solución implementa una aplicación web para la gestión de taquilla cinematográfica (Cineplex), empaquetada mediante tecnologías de contenerización (Docker), protegida bajo el protocolo HTTPS con cifrado criptográfico, e implementada sobre la infraestructura de Amazon Web Services (AWS) utilizando metodologías DevOps para garantizar la trazabilidad del código.

---

## 2. Arquitectura del Sistema y Componentes

El sistema se compone de tres capas fundamentales integradas de manera lineal:

[Cliente / Navegador] ---> (Puerto 443 / HTTPS) ---> [AWS Security Group] ---> [Host EC2 (Ubuntu)] ---> [Contenedor Docker (Nginx / Alpine)]

### A. Capa de Infraestructura (Cloud Computing)
* VPC (Virtual Private Cloud): Red lógica aislada dentro de AWS que delimita el perímetro de seguridad del proyecto.
* Instancia EC2 (Elastic Compute Cloud): Servidor virtual que actúa como Host (Anfitrión) de la solución. Se seleccionó el sistema operativo Ubuntu Linux debido a su estabilidad y compatibilidad con entornos de producción.
* Security Groups (Firewall de Capa de Red): Se configuraron políticas de acceso estrictas:
    * Puerto 22 (SSH): Restringido para la administración y control del servidor mediante CLI.
    * Puerto 443 (HTTPS): Habilitado para el tráfico web general proveniente de internet, garantizando el acceso al servicio telemático de forma segura.

### B. Capa de Contenerización y Servidor Web (Virtualización)
En lugar de depender de configuraciones globales en el sistema operativo Host, el servicio se aisló por completo utilizando Docker:
* Imagen Base (nginx:alpine): Se utilizó una distribución de Alpine Linux optimizada (menos de 5MB), reduciendo la superficie de ataque y el consumo de recursos de hardware (CPU/RAM).
* Servidor Web (Nginx): Actúa como la entidad que atiende el protocolo HTTP/HTTPS, enruta las peticiones de los usuarios y distribuye los recursos web de manera persistente.

### C. Capa de Seguridad (Criptografía)
Para transformar la conexión en un canal seguro se implementó cifrado SSL/TLS:
* OpenSSL: Utilizado en tiempo de compilación del contenedor para generar un par de llaves criptográficas (llave privada y certificado X.509 autofirmado).
* Proxy Seguro: Nginx fue reconfigurado mediante un archivo nginx.conf dedicado para forzar el apretón de manos (SSL Handshake) en el puerto 443, encriptando los flujos de datos simétricamente.

---

## 3. Lógica del Servicio Web (Cineplex)
Para validar que el contenedor expone un servicio completamente funcional y dinámico (excediendo una página estática), la aplicación web cuenta con lógica programada en JavaScript (ECMAScript 6) que corre en el lado del cliente:
* Manejo de Estados: Controla de manera dinámica una matriz de asientos (disponibles, seleccionados y ocupados).
* Manipulación del DOM: Permite la interacción en tiempo real del usuario al hacer clic en la interfaz gráfica.
* Eventos y Validaciones: Calcula tarifas monetarias según la selección ($12,000 COP por tiquete), habilita/deshabilita componentes de control de forma segura, y emite alertas de confirmación al confirmar la venta.

---

## 4. Archivos de Configuración de la Solución

### A. Dockerfile
Archivo declarativo escrito en el lenguaje específico de dominio (DSL) de Docker que define los pasos de construcción de la imagen de producción
