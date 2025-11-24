<p align="center">
  <a href="#" rel="noopener">
 <img src="https://i.imgur.com/8b0GE2B.png" width="180"></a>
</p>

<a href="https://hat.sh" style="color:#000"><h3 align="center">hat.sh</h3></a>

<div align="center">

[![Status](https://img.shields.io/badge/status-active-success.svg)](#)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](#)
[![CodeQL](https://github.com/sh-dv/hat.sh/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/sh-dv/hat.sh/actions/workflows/codeql-analysis.yml)
[![Node.js CI](https://github.com/sh-dv/hat.sh/actions/workflows/node.js.yml/badge.svg?branch=master)](https://github.com/sh-dv/hat.sh/actions/workflows/node.js.yml)
[![Snyk](https://github.com/sh-dv/hat.sh/actions/workflows/snyk.yml/badge.svg)](https://github.com/sh-dv/hat.sh/actions/workflows/snyk.yml)

</div>

---
  README.md – Proyecto DevSecOps Grupo 4 (Versión final)
  PROYECTO "HAT.SH REFORGED"
  
📘 Introducción

Este proyecto corresponde al laboratorio de Ingeniería Reversa y DevSecOps del curso.

El objetivo principal fue:

Analizar la aplicación original Hat.sh

Realizar ingeniería inversa de su estructura interna

Personalizar la UI/UX (logos, textos, títulos, footer)

Eliminar referencias originales y reemplazarlas por el branding del Grupo 4

Construir y ejecutar la aplicación de forma local

Crear una imagen Docker personalizada

Ejecutar análisis de seguridad con Docker Scout

Documentar vulnerabilidades y indicar como aplicar mitigaciones posibles

El resultado final es HatDotSh – DevSecOps Group 4, una edición reforzada, segura y personalizada, completamente funcional y empaquetada en Docker.

1. 🔍 Ingeniería Reversa y Análisis de la Aplicación Original

Se clonó el repositorio original del profesor y se revisó la estructura del proyecto para identificar los puntos clave de personalización y seguridad.

Repositorio original del curso:
https://github.com/jaiderospina/DEVSECOPS_2025_2/tree/main/LAB_ING_REVERSA

Repositorio original de Hat.sh (sh-dv):
https://github.com/sh-dv/hat.sh

1.1 🧩 Tecnologías Identificadas
Frontend

Next.js 12.x (versión antigua, usada por Hat.sh)

React 17

Material UI (MUI v4)

Criptografía

libsodium-wrappers
Utilizada para cifrado simétrico y asimétrico del lado del cliente (client-side).

Librerías Utilizadas

react-dropzone

prismjs

marked

js-yaml

postcss

glob

zxcvbn

Service Worker

Construido con browserify

Permite operar 100% offline

Build Tools

Next build + Next export

Post-build.js

Dockerfile multi-stage

1.2 📁 Estructura del Proyecto Analizado
<img width="1610" height="860" alt="image" src="https://github.com/user-attachments/assets/7a699e60-28a4-4a86-a38a-b0cafe3d3b0e" />


1.3 🎨 Localización y Modificación del Branding

Se identificaron los archivos que contenían los nombres, logos y textos originales.

✔ Logo principal (sombrero)
public/assets/images/logo.png

✔ Logo DevSecOps Grupo 4 (añadido)
public/assets/images/devsecops-logo.png

✔ Modificación del Hero (Pantalla principal)

Archivo:

src/components/Hero.js


Cambios realizados:

Inserción del logo del sombrero

Inserción del logo DevSecOps

Centrado y alineación

Cambio de título a:
"HatDotSh – DevSecOps Group 4"

✔ Modificación del Footer

Archivo:

src/components/Footer.js


Se reemplazó:

❌ “Built and developed by sh-dv”
✔ “Desarrollado por Grupo 4 – Hat.sh DevSecOps Edition Integrantes:”

Integrantes agregados:

Diana Rincón

Carolina Nieto

Guillermo Medina

Brian Pinzón

Favián Garcias

Se eliminó:

Botón de donaciones

Logos de criptomonedas

Texto invitando a donar

Enlace al repo oficial

2. 🐳 Construcción y Ejecución con Docker
   
2.1 Construcción de la imagen personalizada
docker build -t hatsh-devsecopsgrupo4-hatsh .

2.2 Ejecución del contenedor
docker run -d --name hatsh-devsecops -p 3991:3991 hatsh-devsecopsgrupo4-hatsh:latest
o utilizando el comando npm run dev cada que se realizaban modificaciones.


Acceso:

👉 http://localhost:3991

3. 🔐 Análisis de Vulnerabilidades con Docker Scout

Se realizó un escaneo completo de la imagen Docker generada.

3.1 Comandos utilizados
docker scout quickview hatsh-devsecopsgrupo4-hatsh:latest
docker scout cves hatsh-devsecopsgrupo4-hatsh:latest
docker scout recommendations hatsh-devsecopsgrupo4-hatsh:latest

3.2 Resultados del análisis
Severidad	Cantidad
🟥 Critical	0
🟧 High	3
🟨 Medium	8
🟩 Low	4
Paquetes vulnerables detectados:

next@12.3.7

glob@11.0.3

glob@10.4.5

js-yaml@4.1.0

postcss@8.4.14

@babel/runtime@7.15.4

tar@7.5.1

busybox 1.37.0-r19 (imagen Alpine)

Principales CVEs identificadas:

Improper Authorization (Next.js)

Server-Side Request Forgery – SSRF

Race condition (Next.js / tar)

Prototype Pollution (js-yaml)

OS Command Injection (glob)

Busybox outdated (Alpine)

3.3 Conclusiones del análisis

No existen vulnerabilidades críticas, lo cual es un buen indicador.

La mayoría de problemas provienen de la antigüedad de Next.js 12.x, que no puede actualizarse fácilmente sin romper la app.

Varias vulnerabilidades pueden corregirse actualizando librerías (js-yaml, postcss, babel/runtime).

Docker Scout recomienda actualizar la imagen base a:

FROM node:25-alpine

4. 🎨 Personalización Final (Branding del Grupo 4)

Cambios principales:

Elemento	Archivo	Estado
Logo principal	public/assets/images/logo.png	✔ Reemplazado
Logo DevSecOps	public/assets/images/devsecops-logo.png	✔ Añadido
Título principal	Hero.js	✔ Modificado
Footer	Footer.js	✔ Créditos del Grupo 4
Eliminación donaciones	Footer.js	✔ Eliminado
Enlaces GitHub originales	AppBar.js	✔ Removidos
Mensaje snackbar donaciones	locales/*	✔ Eliminado

5. 🧪 Evidencia Final

Inserta aquí la captura final de tu app:
<img width="1311" height="948" alt="image" src="https://github.com/user-attachments/assets/8c43cc1b-7e94-49bc-9877-6f0322bb097a" />
<img width="1024" height="909" alt="image" src="https://github.com/user-attachments/assets/8c669d0b-1174-4be2-b60c-56ad7267a5ae" />
<img width="1001" height="957" alt="image" src="https://github.com/user-attachments/assets/daba82e9-7123-440b-b66f-f02339399182" />
<img width="984" height="981" alt="image" src="https://github.com/user-attachments/assets/4cf525d6-8c06-4cf3-bf52-d32b1d81d78c" />
<img width="1120" height="703" alt="image" src="https://github.com/user-attachments/assets/675875e2-fbc5-4f06-a857-cfd987571853" />
<img width="1004" height="597" alt="image" src="https://github.com/user-attachments/assets/64b86b07-42e1-48b4-b8e9-4382e868aef4" />

![HatDotSh Screenshot](./public/assets/images/final-app.png)

6. 🧠 Conclusiones del Proyecto

Este laboratorio permitió aplicar conceptos esenciales de DevSecOps:

✔ Ingeniería Inversa:
Comprensión profunda del funcionamiento interno de una aplicación web basada en Next.js.

✔ Hardening & Seguridad:
Análisis y mitigación de vulnerabilidades con Docker Scout.

✔ Personalización:
Modificación profesional del branding, UI y textos.

✔ Contenedorización:
Construcción de imagen multistage y despliegue en Docker.

✔ Ciclo DevSecOps completo:
Clonado → Análisis → Modificación → Build → Escaneo → Ejecución.

El resultado final es una versión mejorada, segura y totalmente personalizada de Hat.sh como entrega del Grupo 4.

7. 👥 Créditos – Grupo 4

HatDotSh – DevSecOps Edition

Integrantes:

Diana Rincón

Carolina Nieto

Guillermo Medina

Brian Pinzón

Favián Garciash

8. 📎 Enlaces del Proyecto

Repositorio Grupo 4:

👉 https://github.com/drincon12/hatsh-devsecopsgrupo4 

👉https://hub.docker.com/repository/docker/drincon12/hatsh-devsecops/general


## Credits originales

[libsodium.js](https://github.com/jedisct1/libsodium.js)

[next.js](https://nextjs.org/)

[material-ui](https://material-ui.com/)

<br>

## License

[Copyright (c) 2022 sh-dv](https://github.com/sh-dv/hat.sh/blob/master/LICENSE)
