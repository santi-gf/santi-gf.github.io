---
layout: article
title: Terminal de Linux
subtitle: Introducción a la terminal
# date: 2017-12-26
hidden: true
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

* Toc
{:toc}


## Terminología

Algunas aclaraciones:

**CLI**

: *Command Line Interface*. Es una forma de utilizar un ordenador basada enteramente por texto, sin utilización de gráficos ni de ratón.


**Shell**

: Es el programa que lee cada comando que introduces, lo manda ejecutar e imprime el resultado. También se lo conoce como *intérprete de línea de comandos*.
Existen varios tipos de *shell* diferentes, cada una con ciertos cambios en la sintaxis para escribir comandos. La más extendida es [bash](https://es.wikipedia.org/wiki/Bash), aunque existen otras como [zsh](https://github.com/robbyrussell/oh-my-zsh) (potente y personalizable) y [fish](https://fishshell.com/) (moderna y elegante).


**Terminal**

: Es un programa básico que permite la ejecución de una shell. En entornos gráficos es una aplicación que emula una ventana con una CLI dentro, pero en interfaces puramente de texto llega a ser un intermediario ligero con el *kernel* del sistema operativo.
<br>
El nombre viene de la utilización de ordenadores de tipo *mainframe*, sumamente caros, a los cuales los usuarios se podían conectar desde unos dispositivos llamados [terminales](https://en.wikipedia.org/wiki/Computer_terminal). En UNIX, una conexión al sistema se sigue identificando por un número o puerto de **TTY** (viene de un tipo de terminal llamado [TeleTYpewriter](https://en.wikipedia.org/wiki/Teleprinter)), o **PTY** (*pseudo-tty*, para terminales emuladas).


**Consola**

: Históricamente, era el puerto y la conexión digital en el *mainframe* al que se conectaba una terminal, pero actualmente no hay una clara distinción con la terminal.
En Linux se puede acceder a una consola virtual usando las teclas <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F1</kbd>, y más consolas alternando con <kbd>F2</kbd>, <kbd>F3</kbd>... Se puede volver al entorno gráfico con <kbd>F7</kbd> (puede cambiar según el sistema).

**Prompt**
: Es el texto que aparece en la consola antes del comando que tú escribes, y se puede personalizar completamente (hay [m](https://github.com/justjanne/powerline-go)-[u](https://github.com/azymohliad/qb-prompt)-[c](http://mikebuss.com/2014/02/02/a-beautiful-productive-terminal-experience/)-[h](http://aaronscherer.me/2013/04/20/beautiful-bash-prompt/)-[a](http://brettterpstra.com/2009/11/17/my-new-favorite-bash-prompt/)-[s](http://ezprompt.net) posibilidades). Generalmente muestra al final un `$` para indicar una sesión de *usuario*, y `#` para indicar sesión de *superusuario (root)*.

<!-- https://unix.stackexchange.com/a/4132 -->



## Comandos

Es muy común en Linux que los ficheros de texto plano no tengan extensión, pero sería equivalente a la típica extensión `.txt`.

> **Consejo:** procura evitar siempre espacios en los nombres de ficheros y directorios para mayor comodidad.


### `pwd` --- Directorio de trabajo

En la terminal siempre te encuentras en un directorio concreto de todo el sistema de ficheros. Para saber en cuál estás puedes usar en cualquier momento este directorio de trabajo (*working directory*). Por ejemplo:

```bash
$ pwd
/home/user/hyde/Desktop
```

### `cd` --- Cambiar de directorio

Recuerda que:
- Una ruta absoluta comienza siempre con `/`.
- Una ruta relativa se comienza a escribir partiendo del directorio en el que te encuentras (ver con `pwd`).
- `..` hace referencia al directorio padre, y se puede usar en cualquier momento.
- `.` hace referencia al directorio actual.

Ejemplos:
```bash
$ cd dir/subdir
$ cd /home/usr/hyde
$ cd ..
$ cd ../dir
$ cd ../../dir
```

> **Truco:** comienza a escribir el nombre de algún fichero o directorio que exista, y pulsa la tecla <kbd>TAB</kbd> para que se **autocomplete**. Así ahorras tiempo y evitas errores.

### `ls` --- Listar contenidos
Lista contenidos del directorio en el que te encuentras.

Algunas opciones:
```bash
$ ls -a        # Lista ficheros ocultos
$ ls -l        # Muestra más información
$ ls -h        # Tamaños en Kb/Mb...
$ ls -a -l -h  # Varias opciones
$ ls -alh      # Opciones juntas
```

Los ficheros ocultos son los que comienzan por un punto en su nombre, y no se muestran por defecto en `ls`.

Ejemplo de salida :

![Salida del comando ls -alh]({{ site.baseurl }}{% link /assets/ls-alh.png %})

Las columnas significan:
- Permisos, en formato `<directorio><usuario><grupo><otros>`
- Número de links (si es un directorio indica el número de elemntos que contiene)
- Usuario propietario del elemento
- Grupo propietario
- Tamaño del fichero
- Fecha de la última modificación
- Nombre



### `touch` --- Crear ficheros

Con este comando:
- Creas un fichero vacío si no existe ninguno con ese nombre
- Actualizas la fecha de modificación si el fichero o directorio existe

```bash
$ touch file1 file2
```

### `mkdir` --- Crear directorios

Crea un directorio con el nombre dado.

```bash
$ mkdir mi_directorio
$ mkdir dir1 dir2 dir3
```


### `cp` --- Copiar archivos

Tiene varios argumentos de entrada:
- Origen: uno o varios archivos
- Destino: un directorio (incluyendo `.` o `..`)

```bash
$ cp file1 file2
$ cp dir/f1 dir2/
$ cp f1 f2 f3 dir/
```

La opción `-r` lo hace de forma recursiva, permitiendo copiar directorios y no sólo archivos. En este comando tiene relevancia terminar los directorios con barra `/` o sin ella:

```bash
$ cp -r dir1 dir2
$ cp -r dir1/ dir2
```
En el primer caso, `dir2` acaba conteniendo un directorio llamado `dir1`, mientras que en el segundo caso se copian los contenidos de `dir1` dentro de `dir2`.


### `mv` --- Mover y renombrar

Tiene únicamente dos argumentos:
```bash
mv file1 file2
mv dir1 dir2
```

### `rm` --- Borrar

Borra archivos (y directorios con `-r`) de forma permanente e irrecuperable, sin papelera de reciclaje.
```bash
rm file1
rm file1 file2 file3
rm -r dir/
```


### `*` --- Wildcard

El wildcard `*` se puede utilizar en cualquier comando que trabaje con ficheros:

- `*` se sustituye por todos los archivos en el directorio actual
- `*.jpg` se sustituye por todos los archivos que terminan por `.jpg`
- `img*.png` se sustituye por todos los archivos que comienzan por `img` y terminan por `.png`

Ejemplos:
```bash
$ cp *.jpg dir/
$ ls *.txt
$ ls img*.jpg
$ rm *          # Borra todos los ficheros!
```


### `echo` y `cat` --- Imprimir por pantalla

El comando `echo` permite imprimir el texto indicado por pantalla, aunque se usa sobre todo para redirecciones.

Se pueden introducir saltos de línea escribiendo `\n`.

```bash
$ echo "Hola\nMundo"
Hola
Mundo
```

El comando `cat` imprime el contenido entero de un fichero. No es recomendable usarlo para ficheros muy grandes (ver tamaño con `ls -lh`) ni para ficheros binarios que no tengan únicamente texto.

```bash
$ cat fichero
```


### `>` y `>>` --- Redirección a fichero

Muchos comandos como `echo` y `cat` devuelven texto como salida. Este texto se puede redirigir a un fichero escribiendo `comando > fichero`.
- Si el fichero con ese nombre no existe, se crea
- Si el fichero existe **se reemplazan sus contenidos**, perdiéndose irrecuperablemente lo que tuviese antes

```bash
# echo imprime un texto por pantalla
$ echo "Hola Mundo"
$ echo "Hola Mundo" > hello.txt

# cat imprime los contenidos de un fichero
$ cat hello.txt
$ cat file1 > file2
```

Si se ponen dos ángulos seguidos, el texto redirigido se añade al final del fichero, sin reemplazarlo.

```bash
$ echo "Bye" >> hello.txt
$ cat file1 >> file2
```


### `|` --- Redirección entre comandos

Este símbolo se llama **pipe** (tubería), y permite enviar la salida de un comando no a un fichero, sino como entrada de otro comando. Se escribe como `comando1 | comando2`, y fuciona si el segundo comando acepta entradas por tubería.

Aquí usamos el comando `wc` (*word count*), que da estadísticas sobre el texto que recibe (también se puede usar como `wc file`).
```bash
$ echo "Hola Mundo" | wc

# Se pueden mezclar redirecciones
$ echo "Hola Mundo" | wc > palabras
```


### `sort` y `uniq` --- Ordenar texto

El comando `sort` ordena por líneas un conjunto de datos que reciba por *pipe* o por un fichero.
```bash
$ cat names | sort > sorted-names
```

El comando `uniq` elimina líneas duplicadas siempre que estén seguidas. Por este motivo es muy común ordenarlas antes.
```bash
$ cat names.txt | sort | uniq
$ sort names.txt | uniq
```

{% comment %}
### `grep` --- Filtrar líneas de texto

```bash
cat /etc/passwd | grep root
grep -i cereza recetas.txt
```

### `sed` --- Reemplazar contenido

```bash
$ echo "Hola Mundo" | sed 's/Hola/Bye bye/g'
$ sed 's/snow/rain/g' forests.txt
```

{% endcomment %}


## Para profundizar

- [The Art of Command Line (github)](https://github.com/jlevy/the-art-of-command-line)
- [Bash guide (github)](https://github.com/Idnan/bash-guide)



