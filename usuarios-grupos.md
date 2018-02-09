---
layout: article
title: Usuarios y Grupos en Linux
date: 2018-01-20
hidden: true
---

* Toc
{:toc}


## Usuarios

El concepto de usuario en Linux permite separar entornos de ejecución para diferentes propósitos. Dos personas pueden trabajar simultáneamente en el mismo sistema, teniendo cada uno un usuario diferente, y un directorio personal diferente. 

También es muy común que muchos servicios internos del sistema tengan su propio usuario para restringir el acceso de ese servicio como mecanismo de seguridad. De este modo, si un servicio ve su seguridad comprometida por un ataque, el acceso que tenga el usuario de ese servicio servirá como contención del ataque, y no podrá acceder a ficheros pertenecientes a otro usuario (de persona o servicio).

> **Demonio (daemon)** es el término usado en Linux para referirse al proceso de un servicio que se ejecuta en segundo plano de forma no interactiva. En general acaban por la letra **d**, como **httpd** o **ftpd**.

La configuración de usuarios en Linux esencialmente se maneja en los dos siguientes ficheros.


### `/etc/passwd`

Contiene información de las cuentas de usuarios y sus características.

> name:password:UID:GID:GECOS:directory:shell

Se pueden ver los campos con `man passwd`:

`name`      | Nombre del usuario |
`password`  | El password del usuario en texto plano, o un asterisco (*) o una X si está encriptado. |
`UID`       | *User ID*. Número de identificación único de usuario. Los usuarios pueden cambiar muchos prámetros, incluso su `name`, pero el UID no lo deben cambiar nunca. El UID del root es 0. Las cuentas de servicios y demonios tienen los números más bajos, mientras que las de usuarios finales comienzan en el valor definido en `UID_MIN` en el fichero `/etc/login.defs`. |
`GID`       | *Gruop ID*. Número de identificador único de grupo. Varios usuarios pueden tener el mismo grupo, aunque al crear un usuario se crea un grupo con ese mismo nombre por defecto salvo que se indique lo contrario. Los datos del grupo aparecen en `/etc/group`. |
`GECOS`     | Campo de comentarios que incluye información extra sobre el usuario (nombre real, dirección...) |
`directory` | *Home directory*. Directorio de inicio del usuario. Los usuarios finales se suelen situar bajo `/home`. |
`shell`     | La shell que utiliza por defecto el usuario (en muchos casos es `/bin/bash`). Si el usuario tiene `/sbin/nologin` o `/usr/bin/false`, significa que no tiene permiso para loguearse en el sistema, lo cual es común en *daemons* como medida de seguridad. |

Por ejemplo:

    root:x:0:0:root:/root:/bin/bash
    www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    avahi:x:115:120:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/bin/false
    usuario:x:1000:1000:usuario,,,:/home/usuario:/bin/bash


### `/etc/shadow`

Contiene información sobre contraseñas de los usuarios en `/etc/passwd`, que almacena de manera cifrada.


`login`     | Nombre del usuario |
`password`  | Password encriptado. La función _hash_ usada para encriptar el password se indica al comienzo. Por ejemplo, `$1` se usa para el algoritmo MD5, y `$6` para el SHA-256. Además, puede contener un asterisco `*` o una exclamación `!`, o dos `!!` (ver tras la tabla). |


Si se deshabilita un usuario (comando `usermod -L <user>`), se añade una exclamación (`!`) *al comienzo del campo password*, manteniéndose el hash tras la exclamación. El asterisco (`*`) se usa cuando el password nunca se ha establecido.







{% comment %}

- demonio

{% endcomment %}
