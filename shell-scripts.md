---
layout: article
title: Shell scripts
subtitle: Automatizando comandos de Linux
# date: 2017-12-26
---
<style>
h3 {
  margin-top: 2.5rem;
}
.language-bash .nv {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
</style>

Este tutorial es la continuación del tutorial sobre [la terminal de Linux]({{ site.baseurl }}{% link terminal-linux.md %}).

* Toc
{:toc}


## Comienzo de un script

Un script de la shell es un fichero de texto plano compuesto por comandos de terminal que se ejecutan en conjunto automáticamente.

La primera línea indica el tipo de shell que estamos usando. En el caso de usar la shell de **Bash**, la línea es:

```bash
#!/bin/bash
```

O también, más usado profesionalmente:

```bash
#!/usr/bin/env bash
```

Esta debe ser siempre la primera línea de todo scripts, sin poner saltos de línea ni espacios antes.



# Ejecución de scripts

En un script podemos incluir cualquier comando que usemos desde la terminal. Prueba a guardar lo siguiente en un fichero llamado `test.sh`:

```bash
#!/bin/bash

echo "Este es mi script"
cd ~
ls
```

Puedes ejecutarlo escribiendo `$ bash test.sh` en la terminal.

Otra forma más habitual de ejecutarlo es darle permisos de ejecución primero:

```bash
$ chmod u+x test1.sh  # Añade permiso de ejecución al usuario
$ ./test.sh           # Ejecuta el script
```

La extensión de fichero habitual para scripts es `.sh`, pero también es muy frecuente no poner extensión (en nuestro caso el fichero se llamaría simplemente `test`).

Aunque obviemos esta línea en el resto del tutorial, recuerda que debe aparecer **siempre** en todo script.


## Comentarios

Cualquier línea que comience por una almohadilla `#` es un comentario, y no se ejecuta. Esta es la forma de escribir comentarios que expliquen brevemente lo que hace el código.

También se puede comenzar un comentario a mitad de línea, salvo que esté entre comillas.

```bash
#!/bin/bash

# Imprimir la carpeta de usuario
ls ~

# Imprimir procesos
ps -a    # -a muestra los de todos los usuarios

echo "Dentro de comillas # no cuenta como comentario"

# El siguiente comando está comentado y no se ejecuta
# cd /
```


## Prevención de errores

En tus scripts incluye siempre tras la primera línea, el comando `set -e`. Esto hace que el script no se siga ejecutando si en algún punto encuentra un error. De esta manera evitamos que ese error se pueda propagar generando quizás más errores aún en el resto del script.

```bash
#!/bin/bash
set -e
```

Nosotros obviaremos esta línea el resto del tutorial, pero asegúrate de incluirla **siempre**.




# Variables

Una variable se representa por una palabra que contiene algún dato que podemos usar repetidas veces.

Puedes *definir* una variable (crearla) que contenga una cadena de texto de la siguiente manera:

```bash
nombre_variable="cadena de texto"
```

Asegúrate siempre de que **no existen espacios** ni antes ni después del símbolo igual `=`.

Esta variable ahora la usamos con el símbolo del dólar `$nombre_variable`, también sin espacios.

La ventaja de las variables es que permiten repetir su contenido en múltiples ocasiones en el resto del script. Analiza y prueba el siguiente ejemplo:

```bash
#!/bin/bash

nombre_dir="mi-directorio"
echo "Creando el directorio: $nombre_dir"
mkdir $nombre_dir
touch $nombre_dir/fichero.txt
```

Este script imprime un mensaje por la terminal, crea un directorio, y un fichero dentro de ese directorio. Al tener la variable `nombre_dir`, si queremos cambiar ese nombre únicamente deberemos modificar una línea del fichero, sustituyendo `"mi-directorio"` por otro nombre.

En un script podemos crear tantas variables como queramos con los nombres que elijamos, siempre que no contengan espacios (podemos usar guiones normales o bajos, ej: `mi-variable`, `otra_variable`).



# Capturar la salida de un comando

Como hemos dicho, en cada línea se ejecuta un comando que podríamos escribir en la terminal, y el resultado se muestra por pantalla. Pero en muchas ocasiones nos interesa capturar este resultado para trabajar con él desde el script, en vez de únicamente mostrarlo al usuario.

Existen varias formas de hacer esto, pero la más común son las tildes graves (no las que usamos normalmente en castellano, sino las que van *«hacia atrás»*). Prueba lo siguiente:

```bash
#!/bin/bash

listado=`ls`
```

Comprobarás que al ejecutar el script no se muestra nada. Esto es porque el resultado de `ls` se ha guardado en la variable `listado`, y no hemos hecho nada con ella. Podemos mostrarla con `echo`:

```bash
#!/bin/bash

listado=`ls`
echo "Contenidos del directorio actual:"
echo "$listado"
```

Al ejecutarlo, verás que ya se imprime el listado de ficheros. Fíjate en que hemos puesto el `echo "$listado"`. Pon siempre comillas dobles de esa manera en `echo`, ya que si las quitas cambia su comportamiento y lo imprime en una única línea, lo cual usaremos más adelante.

```bash
$ ./mi_listado
Listado del directorio actual:
ciudades
mi_listado
README.md
```

Recuerda que las variables son muy útiles cuando queremos usarlas varias veces. En este caso, podríamos haber escrito simplemente:

```bash
#!/bin/bash

echo "Listado del directorio actual: `ls`"
```

La captura de comandos es muy común en scripts, y funciona con cualquier comando que puedas escribir en la terminal, incluyendo llamadas a otros scripts.

Dentro de las comillas graves puedes usar cualquier tipo de redirección a fichero o tubería. Analiza el siguiente script:

```bash
#!/bin/bash

echo "Este directorio `pwd` tiene `ls | wc -l` elementos."
```



## Pedir datos al usuario

Desde un script podemos solicitar datos al usuario de manera interactiva con el comando `read variable`. Esto permite al usuario escribir un texto, y al pulsar la tecla <kbd>Enter</kbd>, se guarda ese texto en la variable creada. Prueba a ejecutar lo siguiente:

```bash
#!/bin/bash

echo "Dime tu nombre:"
read nombre
echo "Hola, $nombre"
```

Si lo ejecutamos:

```
Dime tu nombre:
Mr. Hamster
Hola, Mr. Hamster
```

Verás que lo que escribe el usuario va en una línea siguiente a la del `echo`. Para hacerlo en la misma línea, podemos usar la opción `read -p "Texto " variable` (deja un espacio dentro de las comillas para que se vea mejor):

```bash
#!/bin/bash

read -p "Dime tu nombre: " nombre
echo "Hola, $nombre"
```

Si lo ejecutamos esta vez:

```
Dime tu nombre: Mr. Hamster
Hola, Mr. Hamster
```

Ejecuta y analiza este otro ejemplo:

```bash
#!/bin/bash

read -p "Dime un nombre de usuario: " usuario
echo "Estos son los contenidos de tu carpeta de inicio:"
ls /home/$usuario
```


## Condiciones `if`

Dentro de un script puedes comprobar condiciones del tipo *si <condición> entonces <haz_esto>*. Esto se escribe así:

```bash
if [ <condición> ]
then
    # Hacer algo
fi
```

Y también se puede acortar con:
```bash
if [ <condición> ]; then
    # Hacer algo
fi
```

Asegúrate de poner siempre espacios antes y después de la condición, o no funcionará como esperas.

La condición para comparar dos cadenas de texto es con el doble igual `==`, por ejemplo:

```bash
var="hola"
if [ $var == "hola" ]
then
    echo "La variable es hola"
fi
```

También puedes comprobar que una cadena sea **diferente de** otra con `!=`.

También se pueden hacer comprobaciones sobre si ficheros o directorios existen:

```bash
read -p "Dime un fichero: " fichero
if [ -a $fichero ]
then
    echo "El fichero existe"
fi
```

Se puede hacer una comprobación opuesta añadiendo `!` antes de la opción (separada por espacio):

```bash
read -p "Dime un fichero: " fichero
if [ ! -a $fichero ]
then
    echo "El fichero no existe"
fi
```

Esta tabla resume algunas comprobaciones sobre ficheros:

`-a` | ¿Existe el archivo? |
`-d` | ¿Es un directorio?  |
`-f` | ¿Es un fichero?     |
`-r` | ¿Es un fichero de lectura?     |
`-w` | ¿Se puede escribir el fichero? |
`-x` | ¿Es un fichero ejecutable?     |

También puedes realizar comprobaciones del tipo *si <condición> entonces <haz_esto> si no <haz_esto_otro>* añadiendo `else`: 

```bash
if [ <condición> ]
then
    # Hacer algo
else
    # Hacer otra cosa
fi
```

Este ejemplo es una versión más completa de otro visto previamente:

```bash
read -p "Dime un nombre de usuario: " usuario

if [ -d /home/$usuario ]
then
    echo "Estos son los contenidos de tu carpeta de inicio:"
    ls /home/$usuario
else
    echo "Ese usuario no tiene carpeta de inicio"
fi
```


## Bucles `for`

Prueba el siguiente código con un bucle `for`:

```bash
#!/bin/bash
for variable in 1 2 3 4 5
do
   echo "Imprimiento $variable"
done
```

Todas las líneas de código entre `do` y `done` se repiten varias veces, y lo único que cambia es el contenido de la variable que crea el bucle `for`.

