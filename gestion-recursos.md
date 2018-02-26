---
layout: article
title: Gestión de Recursos Linux
subtitle: 
hidden: true
# date: 2018-02-10
---

* Toc
{:toc}

## Ficheros de dispositivo: `/dev`

Una de las cuestiones que debe responder el Kernel de un sistema operativo es cómo interactuar con los periféricos. Linux responde con uno de sus principios básicos: **en Linux, todo es un fichero.**

Al conectar físicamente un dispositivo al ordenador, aparece para él un **fichero especial o fichero de dispositivo** dentro de `/dev`. Al leer y escribir sobre este fichero, el kernel lo traduce en comunicación de *entrada/salida* con el dispositivo.


