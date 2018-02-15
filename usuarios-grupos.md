---
layout: article
title: Usuarios y Grupos en Linux
date: 2018-01-20
---

* Toc
{:toc}


## Usuarios

El concepto de usuario en Linux permite separar entornos de ejecución para diferentes propósitos. Dos personas pueden trabajar simultáneamente en el mismo sistema, teniendo cada uno un usuario diferente, y un directorio personal diferente. 

También es muy común que muchos servicios internos del sistema tengan su propio usuario para restringir el acceso de ese servicio como mecanismo de seguridad. De este modo, si un servicio ve su seguridad comprometida por un ataque, el acceso que tenga el usuario de ese servicio servirá como contención del ataque, y no podrá acceder a ficheros pertenecientes a otro usuario (de persona o servicio).

> **Demonio (daemon)** es el término usado en Linux para referirse al proceso de un servicio que se ejecuta en segundo plano de forma no interactiva. En general acaban por la letra **d**, como **httpd** o **ftpd**.

La configuración de usuarios en Linux esencialmente se maneja en los dos siguientes ficheros.


### Archivo `/etc/passwd`

Contiene información de las cuentas de usuarios y sus características.

> name:password:UID:GID:GECOS:directory:shell

Se pueden ver los campos con `man passwd`:

**Login**     | Nombre del usuario |
**Password**  | El password del usuario en texto plano, o un asterisco `*` o una `X` si está encriptado. |
**UID**       | **User ID**. Número de identificación único de usuario. Los usuarios pueden cambiar muchos prámetros, incluso su `name`, pero el UID no lo deben cambiar nunca. El UID del root es `0`. Las cuentas de servicios y demonios tienen los números más bajos, mientras que las de usuarios finales comienzan en el valor definido en `UID_MIN` en el fichero `/etc/login.defs`. |
**GID**       | **Gruop ID**. Número de identificador único de grupo. Varios usuarios pueden tener el mismo grupo, aunque al crear un usuario se crea un grupo con ese mismo nombre por defecto salvo que se indique lo contrario. Los datos del grupo aparecen en `/etc/group`. |
**GECOS**     | Campo de comentarios que incluye información extra sobre el usuario (nombre real, dirección...) Informalmente se le llama información *finger*. |
**directory** | **Home directory**. Directorio de inicio del usuario. Los usuarios finales se suelen situar bajo `/home`. |
**Shell**     | La shell que utiliza por defecto el usuario (en muchos casos es `/bin/bash`). Si el usuario tiene `/sbin/nologin` o `/usr/bin/false`, significa que no tiene permiso para loguearse en el sistema, lo cual es común en *daemons* como medida de seguridad. |

Por ejemplo:

    root:x:0:0:root:/root:/bin/bash
    www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    avahi:x:115:120:Avahi mDNS daemon,,,:/var/run/avahi-daemon:/bin/false
    usuario:x:1000:1000:usuario,,,:/home/usuario:/bin/bash


### Archivo `/etc/shadow`

Contiene información sobre contraseñas de los usuarios en `/etc/passwd`, que almacena de manera cifrada.


**Login**       | Nombre del usuario |
**Password**    | Password encriptado. La función _hash_ usada para encriptar el password se indica al comienzo. |
**Lastmod**     | Tiempo transcurrido desde el último cambio de clave. |
**Min**         | Número mínimo de días hasta que se puede volver a cambiar la contraseña. |
**Max**         | Número máximo de días hasta que el sistema obliga a cambiar la contraseña del usuario. |
**Aviso**       | Número de días previos al **Max** en los que el usuario es avisado de su obligado cambio de contraseña. |
**Inactividad** | Número de días entre el vencimiento de la contraseña y el bloqueo de la cuenta. |
**Expiración**  | Fecha en la que la cuenta se deshabilita. Si se deja en blanco, la cuenta nunca expira. |
**Reservado**   | Campo reservado para futuros usos. |


Sobre el campo del password:

- `*` se usa cuando la cuenta nunca ha tenido un password.
- `!` significa que la cuenta ha sido deshabilitada para loguearse mediante password.

Cuando se bloquea una cuenta (lock: `usermod -l user`), no se borra el password del usuario, sino que se añade una exclamación `!` al comienzo del hash del password para indicar que se ha bloqueado. Al desbloquear el usuario (unlock: `usermod -u user`) se elimina la exclamación, dejando el hash como estaba antes.

{% comment %}
Por ejemplo, `$1` se usa para el algoritmo MD5, y `$6` para el SHA-256. Además, puede contener un asterisco `*` o una exclamación `!` (ver tras la tabla).
{% endcomment %}


### Comandos de gestión de usuarios

La [Tool Suite Shadow](https://pkg-shadow.alioth.debian.org/features.php) es una colección de comandos que permiten gestionar usuarios sin necesidad de manipular los ficheros `/etc/passwd` y `/etc/shadow` directamente, lo cual no es recomendable ante la posibilidad de dejar inconsistencias en ficheros tan delicados. Algunos de los comandos:

- `useradd` -- crea un usuario.
- `userdel` -- borra un usuario.
- `usermod` -- realiza modificaciones sobre los datos de `/etc/passwd`. Tiene una opción para cada uno de los campos, excepto el campo **GECOS**. Incluye opciones para (des)bloquear un usuario (`--lock` y `--unlock`).
- `chfn` -- modifica la información *finger* (**GECOS**).
- `chsh` -- modifica la shell.
- `id` -- imprime información sobre el usuario y sus grupos. Ej:
```bash
$ id -u   # Imprime el UID
$ id -un  # Imprime el login
```
- `chage` -- *change age* visualiza y modifica todas las fechas de contraseña de `/etc/shadow`.


También existen los comandos `adduser` y `deluser` que son más *user-friendly* y ahorran algo de trabajo, por lo que se utilizan con más frecuencia en la práctica.


> Usa el manual `man` o las opciones `-h` o `--help` para ver todas las opciones que ofrecen estos comandos, ya que pueden cambiar según distribuciones.
{:.text-tip}


Para establecer y cambiar una contraseña:

- `usermod -p PASSWORD USER` guarda el password indicado sin encriptar (habría que pasarle un hash del password). No conviene usar esta opción.
- `passwd USER` es el comando que se utiliza, que permite introducir un password con seguridad.


Con el comando `finger` podemos obtener información del **GECOS** de cualquier usuario:
```bash
$ finger theuser
Login: theuser        			Name: Juan Pérez
Directory: /home/theuser            	Shell: /bin/bash
Office: 101, +34 123 456		Home Phone: +34 983 12 34 56
On since Wed Feb 04 10:26 (EST) on pts/1   3 seconds idle
     (messages off)
No mail.
No Plan.
```



## Grupos

Los grupos permiten conceder permisos a un conjunto de usuarios simultáneamente.

En Linux un usuario tiene los siguientes grupos:

- **Grupo primario:** es el que consta como su *GID* en `/etc/passwd`. <u>Sólo puede haber un grupo primario</u>.
- **Grupos secundarios o suplementarios:** son los gestionados en el fichero `/etc/groups`, donde se puede añadir un usuario a más grupos.

Además, durante la sesión de usuario se puede cambiar temporalmente el grupo al que pertenece el usuario:

- **Grupo real:** es su grupo primario que consta en `/etc/passwd`. Es el grupo al que pertenece un usuario cuando inicia sesión.

- **Grupo efectivo:** mediante el comando `newgrp` se puede cambiar el grupo primario al que pertenece el usuario, y la configuración es efectiva hasta que cierre la seción o vuelva a cambiar de grupo efectivo.



{% comment %}
https://unix.stackexchange.com/a/18203
- Grupo real y efectivo
- Grupo primario y suplementario
{% endcomment %}


### Archivo `/etc/group`

Este archivo contiene información sobre los grupos del sistema. Su estructura es similar a la de los archivos `passwd` y `shadow`, contando con los siguientes campos:

**Grupo**    | Nombre del grupo. |
**passwd**   | Password que permite a un usuario cambiar de grupo. Si está vacío no requiere contraseña, y una `x` significa que se gestiona mediante el archivo `/etc/gshadow`. |
**GID**      | *Group ID*. Identificador único (numérico) para el grupo. |
**Miembros** | Lista separada por comas con los nombres de usuario que pertenecen a ese grupo. |

De forma similar, al fichero `/etc/shadow`, existe el fichero `/etc/gshadow`, que almacena los passwords de los grupos encriptados con un *hash* y también trabaja con los símbolos asterisco `*` y exclamación `!`.


### Comandos de gestión de grupos

La suite *Shadow* también incluye los comandos:

- `groupadd` -- añade un nuevo grupo
- `groupdel` -- borra un grupo
- `groupmod` -- Modifica la información de `/etc/groups`
- `gpasswd` -- Modifica el password del grupo, reflejado en `/etc/gshadow`


### Modificar grupos de usuarios

Una vez tenemos un grupo creado, podemos añadírselo como primario o secundario a un usuario usando el comando `usermod`, con las siguientes opciones:

```bash
$ usermod --help
Usage: usermod [options] LOGIN

Options:
  ...
  -g, --gid GROUP               force use GROUP as new primary group
  -G, --groups GROUPS           new list of supplementary GROUPS
  -a, --append                  append the user to the supplemental GROUPS
                                mentioned by the -G option without removing
                                him/her from other groups
```

Por lo tanto:
```bash
$ # Modificar el grupo primario
$ usermod -g GROUP USER
$ # Reemplazar el grupo secundario
$ usermod -G GROUP USER
$ # Añadir un grupo secundario al usuario
$ usermod -a -G GROUP USER
```

{% comment %}
http://www.hostingadvice.com/how-to/linux-add-user-to-group/
{% endcomment %}



