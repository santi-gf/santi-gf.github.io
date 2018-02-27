---
layout: article
title: Gestión de Recursos Linux
subtitle: 
# date: 2018-02-10
---

* Toc
{:toc}

## Ficheros de dispositivo: `/dev`

Una de las cuestiones que debe responder el Kernel de un sistema operativo es cómo interactuar con los periféricos. Linux responde con uno de sus principios básicos: **en Linux, todo es un fichero.**

Al conectar físicamente un dispositivo al ordenador, aparece para él un **fichero especial o fichero de dispositivo** dentro de `/dev`. Al leer y escribir sobre este fichero, el kernel lo traduce en comunicación de *entrada/salida* con el dispositivo.

Los ficheros en este directorio se organizan según el uso que tienen. Algunos de ellos son:

`/dev/sd<x><y>` | Discos duros SCSI o SATA. `<x>` es una letra de identificación del disco, e `<y>` identifica la partición.|
`/dev/hd<x><y>` | Discos duros IDE.|
`/dev/cdrom<x>` | Unidades ópticas.|
`/dev/usb<x>`   | Unidades USB.|
`/dev/lp`       | Impresoras (line-printer).|
`/dev/tty`      | Terminales usadas en el sistema.|

Existen además algunos ficheros especiales que no pertenecen a dispositivos externos, y se usan únicamente por software. Por ejemplo:

`/dev/null` | Acepta cualquier entrada y la descarta. Se usa en ocasiones para redirigir la salida aquí y que no se muestre por pantalla. Al ser leído, no devuelve nada (sólo el carácter de *fin-de-fichero*). |
`/dev/random` | Al ser leído, genera un stream ilimitado de números aleatorio. Devuelve números en binario, no en ASCII, por lo que no se muestran con `cat`, pero es la base de usa *Bash* cuando escribimos `echo $RANDOM`. |