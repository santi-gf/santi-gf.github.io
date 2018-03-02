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

| Fichero | Descripción
|---|---
| `/dev/sd<x><y>` | Discos duros SCSI o SATA. `<x>` es una letra de identificación del disco, e `<y>` identifica la partición.
| `/dev/hd<x><y>` | Discos duros IDE.
| `/dev/cdrom<x>` | Unidades ópticas.
| `/dev/usb<x>`   | Unidades USB.
| `/dev/lp`       | Impresoras (line-printer).
| `/dev/tty`      | Terminales usadas en el sistema.

Existen además algunos ficheros especiales que no pertenecen a dispositivos externos, y se usan únicamente por software. Por ejemplo:

| Fichero | Descripción
|---|---
`/dev/null` | Acepta cualquier entrada y la descarta. Se usa en ocasiones para redirigir la salida aquí y que no se muestre por pantalla. Al ser leído, no devuelve nada (sólo el carácter de *fin-de-fichero*). |
`/dev/random` | Al ser leído, genera un stream ilimitado de números aleatorio. Devuelve números en binario, no en ASCII, por lo que no se muestran con `cat`, pero es la base de usa *Bash* cuando escribimos `echo $RANDOM`. |


## Montaje de unidades

La forma de trabajo con dispositivos de almacenamiento en Windows y Linux tiene sustanciales diferencias. Mientras que Windows asigna una unidad diferente a cada dispositivo (`C`, `D`...), Linux trabaja con un único árbol de directorios de modo que cuando montamos un dispositivo le indicamos que sus archivos serán colgados a partir de un directorio concreto a partir del cual serán accesibles.

Un **montaje** es la asociación del fichero especial de un dispositivo junto con la ruta del árbol de directorios en la cual se va a acceder a la información.

El comando utilizado para montar unidades tiene la siguiente forma:
```
mount <opciones> <dispositivo> <directorio_de_montaje>
```

- Para identificar el dispositivo es útil el comando `fdisk -l`, que lista los dispositivos conectados con información sobre ellos. De este modo podemos identificar qué fichero en `/dev` es el del dispositivo que queremos montar.
- Para el directorio de montaje necesitaremos crearlo antes si no existe ya. Se puede hacer en cualquier directorio, aunque es común situar los medios extraíbles en `/media` o `/mnt`.
- Las opciones conviene mirarlas con `man mount`. Una común es indicar el formato del sistema de ficheros (`-t vfat`, `-t ext3`, `-t ntfs-3g`, `-t nfs`...)

Por ejemplo:
```
mount -t vfat /dev/sdb1 /media/usb
```

Para desmontarlo se usa `umount` con el directorio montado:
```
umount /media/sdb1
```

### Ver unidades montadas

Los sistemas de montaje como `mount` actualizan el fichero `/etc/mtab` con información sobre las unidades que montan. Se pueden mostrar en cualquier momento:
```
$ sudo cat /etc/mtab
/dev/xvda1 / ext4 rw,discard 0 0
proc /proc proc rw 0 0
...
```

Sin embargo, también existe un fichero virtual llamado `/proc/mounts` que se lee como cualquier otro, pero cuyos contenidos se generan en el momento por el Kernel cada vez que es leído con información sobre el estado de los dispositivos montados. En caso de duda, éste es el fichero que tiene la información más actualizada y fiable.
```
$ sudo cat /proc/mounts
/dev/sda2 / ext4 rw 0 0
proc /proc proc rw,realtime 0 0
...
```


### Fichero `/etc/fstab`

Este fichero contiene la configuración de las particiones que han de ser montadas automáticamente durante el proceso de arranque. De este modo podemos evitar montarlas manualmente. Además, podemos indicarle algunos parámetros para que la unidad sea sólo de lectura o de lectura y escritura, y si permitimos o no al usuario montarla y desmontarla posteriormente.

Este fichero se edita con privilegios con cualquier editor de texto plano. Tiene contenidos del estilo:
```
$ sudo cat /etc/fstab
/dev/sdb /mount/usb vfat rw,user,noauto 0 0
/dev/hda7 /mnt/compartidos vfat umask=000 0 0
/dev/hda1 /mnt/WinXP ntfs-3g quiet,defaults,locale=en_US.utf8,umask=0 0 0
...
```


## Archivos compartidos (NFS)

NFS (*Network File System*) es un servicio que permite la compartición de archivos con sistemas de tiepo UNIX.

La relación entre los equipos NFS funciona del siguiente modo:
- El servidor NFS debe **exportar** los directorios que va a compartir.
- Los clientes deben **montar** los directorios compartidos en algún punto del sistema de ficheros. Cada cliente puede tener acceso simultáneo a varios directorios compartidos de un mismo o varios servidores.


### Servidor NFS

El servidor debe indicar los directorios a exportar en el fichero `/etc/exports`. Se usa una sintaxis como la siguiente:
```
<directorio> <host>(<permisos>) <host>(<permisos>)...
```
- `<directorio>` es el directorio que se desea compartir.
- `<host>` es una IP o nombre DNS del host al que se le permite acceso. Se pueden indicar un conjunto de IPs usando el asterisco (ver ejemplo).
- `<permisos>` pueden ser de sólo lectura (`ro`, *read-only*) o lectura y escritura (`rw`, *read-write*).

Ejemplos en `/etc/exports`. El uso del asterisco `*` permite exportar un directorio a un rango de IPs:
```
/home/smr/enunciados 192.168.1.5(ro)
/home/smr/entregas 192.168.1.*(rw)
```

Tras cambiar este fichero, hay que reiniciar el servicio NFS:
```bash
$ sudo service nfs restart
```


### Cliente NFS

El montaje de directorios compartidos se puede realizar de dos formas principalmente, relacionadas con lo visdo en los apartados anteriores:

1. Mediante el comanto `mount` se puede montar el directorio compartido como si de un dispositivo de almacenamiento se tratase. El siguiente ejemplo monta el directorio del ejemplo anterior en el directorio local `/home/entregas-servidor`.
```bash
$ sudo mount 192.161.1.2:/home/smr/entregas /home/entregas-servidor
```

2. Mediante el fichero `/etc/fstab` se puede configurar que el montaje se realice automáticamente durante el arranque del sistema. Por ejemplo, se puede añadir en este fichero una línea como la siguiente:
```
192.161.1.2:/home/smr/entregas /home/entregas-servidor nfs defaults 0 0
```
