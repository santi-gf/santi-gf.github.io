---
layout: article
title: Terminal de Linux
subtitle: Introducción a la terminal
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
.text-tip::before {
    content:"➜";
    float: left;
    padding-right: 5px;
}
.text-tip {
    color: #941818;
} 
.code-small pre {
    font-size: 0.6rem;
}
.code-med pre {
    font-size: 0.7rem;
}
</style>

* Toc
{:toc}


## Terminología

Algunas aclaraciones:

**CLI**

: *Command Line Interface*. Es una forma de utilizar un ordenador basada enteramente por texto escribiendo comandos, sin utilización de gráficos ni de ratón.


**Prompt**
: Para indicar que se puede comenzar a escribir un comando, se muestra primero un texto con algo de información, llamado *prompt*. Se puede personalizar por completo, pero es común que muestre un `$` en una sesión de *usuario*, y `#` en una de *superusuario (root)*.

**Shell**

: Es el programa que lee cada comando que introduces, lo manda ejecutar e imprime el resultado. También se lo conoce como *intérprete de línea de comandos*.
Existen varios tipos de *shell* diferentes, cada una con ciertos cambios en la sintaxis para escribir comandos. La más extendida es [bash](https://es.wikipedia.org/wiki/Bash), aunque existen otras como [zsh](https://github.com/robbyrussell/oh-my-zsh) (potente y personalizable) y [fish](https://fishshell.com/) (moderna y elegante).


**Terminal**

: Es un programa básico que permite la ejecución de una shell. En entornos gráficos es una aplicación que emula una ventana con una CLI dentro, pero en interfaces puramente de texto llega a ser un intermediario ligero con el *kernel* del sistema operativo.
<br>
El nombre viene de la utilización de ordenadores de tipo *mainframe*, sumamente caros, a los cuales los usuarios se podían conectar desde unos dispositivos llamados [terminales](https://en.wikipedia.org/wiki/Computer_terminal). En UNIX, una conexión al sistema se sigue identificando por un número o puerto de **TTY** (viene de un tipo de terminal llamado [TeleTYpewriter](https://en.wikipedia.org/wiki/Teleprinter)), o **PTY** (*pseudo-tty*, para terminales emuladas).


**Consola**

: Históricamente, era el puerto y la conexión digital en el *mainframe* al que se conectaba una terminal, pero actualmente no hay una clara distinción con la terminal.
En Linux se puede acceder a una consola virtual usando las teclas <kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>F1</kbd>, y más consolas alternando con <kbd>F2</kbd>, <kbd>F3</kbd>... Se puede volver al entorno gráfico con <kbd>F7</kbd> (puede cambiar según el sistema).


<!-- https://unix.stackexchange.com/a/4132 -->



## Comandos

Es muy común en Linux que los ficheros de texto plano no tengan extensión, pero sería equivalente a la típica extensión `.txt`.

> **Consejo:** procura evitar siempre espacios en los nombres de ficheros y directorios para mayor comodidad.

Si en algún momento un comando no termina y no te devuelve al prompt, puedes pulsar <kbd>Ctrl</kbd><kbd>C</kbd> para finalizarlo.

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
- Un punto `.` significa el directorio actual.
- Dos puntos `..` significan el directorio padre.

Ejemplos:
```bash
$ cd dir/subdir
$ cd ./dir/subdir  # Equivalente al anterior
$ cd /usr/bin
$ cd ..
$ cd ../dir
$ cd ../../dir
```

> **Truco:** comienza a escribir el nombre de algún fichero o directorio que exista, y pulsa la tecla <kbd>TAB</kbd> para que se **autocomplete**. Así ahorras tiempo y evitas errores.


Las siguientes entradas de `cd` son muy frecuentes:
- `cd ~`: La tilde (*virgulilla*) lleva al directorio de inicio del usuario.
- `cd -`: El guión lleva al anterior directorio previo al último `cd`.



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

Se pueden introducir saltos de línea escribiendo `\n` si usas la opción `-e`.

```bash
$ echo "Hola Mundo"
Hola Mundo
$ echo -e "Hola\nMundo"
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

Este símbolo se llama **pipe** (tubería o [pelca](https://es.wikipedia.org/wiki/Pleca)), y permite enviar la salida de un comando no a un fichero, sino como entrada de otro comando. Una *pipeline* se escribe como `comando1 | comando2 | comando3 ...`. Ten en cuenta que no todos los comandos devuelven un resultado.

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


### `head` y `tail` --- Partes de un texto

Estos comandos permiten ver las primeras y últimas líneas de un archivo de texto. La opción `-n 3` indica que muestre sólo 3 líneas; sin esa opción muestra 10 por defecto.

```bash
$ head file
$ head -n 15 file

$ cat file | head -n 25 | tail -n 1
```

El último comando imprime únicamente la línea número 25 del fichero.


### `wc` --- Word count

Este comando muestra estadísticas sobre un fichero o la entrada por tubería:

```bash
$ echo "hola mundo" | wc
       1       2      11
$ wc README.md 
      37     163    1269 README.md
```

Esto imprime, por orden: número de **líneas**, **palabras** y **caracteres** del texto.

Debes tener en cuenta que la mayoría de los comandos como `echo` añaden el carácter de salto de línea, y `wc` también lo tiene en cuenta, dado que es parte de su *input*. Por eso, en `hola mundo` imprime 11 caracteres, en vez de los 10 que podríamos decir que hay.


### `grep` --- Filtrar líneas de texto

Con `grep` podemos filtrar los contenidos de texto por líneas, por ejemplo para saber si un fichero contiene cierta información, y dónde.

```bash
$ cat /etc/passwd | grep root
$ grep cereza recetas.txt
```

Con la opción `-i` se invierte la búsqueda, y devuelve las líneas que no contienen el término de búsqueda.
```bash
$ grep -i cereza recetas.txt
```

**Ejemplo:** El comando `ps aux` muestra procesos en ejecución. Con el siguiente comando podemos filtrar por el nombre de alguno de ellos y ver información (quizás para matar ese proceso).
```bash
$ ps aux | grep bash
```


También podemos emplear patrones (llamados técnicamente *expresiones regulares*) para afinar la búsqueda:

- `^` significa comienzo de línea
- `$` significa fin de línea

Así, podemos filtrar por las líneas que no simplemente contengan, sino que comiencen o finalicen por un texto:

Usuarios del sistema cuyo nombre comienza por `root` (partiendo de que en `/etc/passwd` cada línea comienza por el nombre de usuario):
```bash
$ cat /etc/passwd | grep "^root"
root:x:0:0:root:/root:/bin/bash
```

> Al usar `grep` es recomendable escribir el término entre comillas, aunque si el patrón que escribimos no contiene espacios no es necesario.
{:.text-tip}


**Ejemplo:** Lista únicamente los directorios (partiendo de que `ls -l` comienza por `d` sólo para directorios):
```bash
$ ls -l
drwxr-xr-x  1 user user    841 24 Jan 19:27 imagenes
-rw-r--r--  1 user user  11940  6 Dec 13:27 lista.txt
-rw-r--r--  1 user user   2822  6 Dec 13:27 txt_user
-rw-r--r--  1 user user    176 19 Jan 16:28 README.md
drwxr-xr-x  1 user user   4085  8 Dec 18:34 recursos
-rw-r--r--  1 user user    358  7 Dec 12:11 registro.txt
$ ls -l | grep "^d"
drwxr-xr-x  1 user user    841 24 Jan 19:27 imagenes
drwxr-xr-x  1 user user   4085  8 Dec 18:34 recursos
$ ls -l | grep ".txt$"
-rw-r--r--  1 user user  11940  6 Dec 13:27 lista.txt
-rw-r--r--  1 user user    358  7 Dec 12:11 registro.txt
```


### `cut` --- Cortar porciones de texto

Este comando permite quedarnos con partes de texto que estén bien estructurados siempre que podamos establecer un carácter que divida los contenidos.

Por ejemplo, un fichero en formato `csv` utiliza la coma o el punto y coma para separar los campos:

Puedes utilizar `cut` para tratar este fichero como una tabla y filtrar una o varias columnas. Hay dos opciones importantes:

- `-d` (*delimiter*) Permite usar el carácter que le indiques como delimitador:
  - `-d' '` usa el espacio como delimitador.
  - `-d'\t'` usa el tabulador (es el valor por defecto si no se indica esta opción).
- `-f` (*field*) Permite indicar los campos (columnas) con los que nos queremos quedar:
  - `-f1` extrae el primer campo
  - `-f1,2,4` extrae los campos 1, 2 y 4.
  - `-f1-3` extrae los campos del 1 al 3

Por ejemplo, partiendo del siguiente fichero llamado `Tarantino.csv`:

    Pulp Fiction,1994,5
    Reservoir Dogs,1992,4
    Kill Bill: Volume 1,2003,4.5
    Inglourious Basterds,2009,4.5
    Django Unchained,2012,5

```bash
$ cat Tarantino.csv | cut -d',' -f2
1994
1992
2003
2009
2012
$ cat Tarantino.csv | cut -d',' -f1,3
Pulp Fiction,5
Reservoir Dogs,4
Kill Bill: Volume 1,4.5
Inglourious Basterds,4.5
Django Unchained,5
```
    
    


### `man` --- Manual de ayuda

Puedes buscar información sobre lo que hace y las opciones que tiene un comando mirándolo en el manual del sistema.
```bash
$ man ls
```

- Desplázate con los cursores <kbd>↑</kbd> y <kbd>↓</kbd>.
- Busca una palabra tecleando la barra<kbd>/</kbd> y luego la palabra: `/texto`.
- Sal del manual con la tecla <kbd>q</kbd>.




### Más ayuda

Además, muchos comandos incluyen una opción `-h` o `--help`, que muestra información breve sobre las opciones que admiten, aunque los que hemos visto en esta página son suficientemente básicos como para no incluirla.


---

## Ejercicios propuestos


- En una única línea: usando `echo` escribe en cuatro nombres de persona, **uno por línea**, y haz que se guarde en el fichero `nobmres`. El resultado debería ser algo como:

    ```bash
    Laura
    Edward
    Sarah
    Julian
    ```

- Lista todos los ficheros markdown `.md`.
- Copia todos los ficheros `.md` al directorio `markdown` (suponiendo que ya está creado).
- Filtra los resultados de `ls -l` para mostrar únicamente:
  - Los directorios
  - Los ficheros de 2017.
  - Los ficheros (no directorios) que sólo tienen permiso de lectura para el usuario.
- Busca en el `man` la opción para que `ls` liste los ficheros ordenados por tamaño (en inglés, *size*).
- El comando `dig`, con la opción `any`, muestra todos los registros DNS de un servidor (ej: `dig twitter.com any`). Úsalo para extraer únicamente los registros de correo electrónico (`MX`).


## Ejemplos resueltos

### Extraer la línea *n* de un fichero

**Enunciado:**
Extraer la línea número 4 de un fichero cualquiera.

**Resolución:**

Supongamos el fichero `ciudades`:

    Birmingham
    Lyon
    Nüremberg
    Brno
    Panaji

Con el comando `head` podemos extraer las 4 primeras líneas:

```bash
$ cat ciudades | head -n4
Birmingham
Lyon
Nüremberg
Brno
```

Y con el comando `tail` podemos extraer la última:
```bash
$ cat ciudades | head -n4 | tail -n1
Brno
```


### Gráfica *ping*

**Enunciado:**

Crear una gráfica con los tiempos de respuesta a 200 *pings* a un servidor.

Algunos datos:

- `ping -c5 -i0.3` envía 5 paquetes ICMP a un intervalo más corto de 0.3 segundos (por defecto es 1s).
- Debes extraer del resultado de `ping` únicamente los tiempos de respuesta, y guardarlos en un fichero (ej: `pingtimes`).
- A partir de ese fichero, puedes crear la gráfica con el comando `gnuplot -p -e 'plot "pingtimes"'`.
  - Instala *gnuplot* si no lo tienes en tu sistema: `sudo apt-get install gnuplot-x11`.



**Resolución:**

Tenemos que analizar la salida del comando *ping* (lo probamos sólo con 5 pings por ahora):

```
$ ping -c5 -i0.3 google.com
PING google.com (216.58.211.238) 56(84) bytes of data.
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=1 ttl=55 time=8.98 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=2 ttl=55 time=13.9 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=3 ttl=55 time=16.0 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=4 ttl=55 time=8.87 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=5 ttl=55 time=18.5 ms

--- google.com ping statistics ---
10 packets transmitted, 10 received, 0% packet loss, time 9012ms
rtt min/avg/max/mdev = 8.873/12.859/18.548/3.328 ms
```
{:.code-small}

Primero tenemos que filtrar únicamente las líneas que queramos. Podemos fijarnos, por ejemplo, en que las líneas que queremos son las únicas que incluyen el texto "bytes from". Así que podemos filtrar:

```bash
$ ping -c5 -i0.3 google.com | grep "bytes from"
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=1 ttl=55 time=8.98 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=2 ttl=55 time=13.9 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=3 ttl=55 time=16.0 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=4 ttl=55 time=8.87 ms
64 bytes from mad01s24-in-f238.1e100.net (216.58.211.238): icmp_seq=5 ttl=55 time=18.5 ms
```
{:.code-small}

Ahora nos debemos quedar únicamente con los tiempos. Podemos ver que podemos separar campos por espacios con `cut` y quedarnos con el que nos interesa:

```bash
$ ping -c5 -i0.3 google.com | grep "bytes from" | cut -d' ' -f8
time=8.98
time=13.9
time=16.0
time=8.87
time=18.5
```
{:.code-med}

Y ahora podemos separar campos por el símbolo `=`:

```bash
$ ping -c5 -i0.3 google.com | grep "bytes from" | cut -d' ' -f8 | cut -d'=' -f2
8.98
13.9
16.0
8.87
18.5
```
{:.code-med}

Ahora que tenemos esto, podemos modificar el comando para que lo pruebe con 200 paquetes, y escriba el resultado en un fichero, y lo mostramos con *gnuplot*:

```bash
$ ping -c200 google.com | grep "bytes from" | cut -d' ' -f8 | cut -d'=' -f2 > pingtimes
$ gnuplot -p -e 'plot "pingtimes"'
```

![Gráfica con los tiempos de ping]({{ site.baseurl }}{% link /assets/terminal-linux-pingtimes.png %}){:.mx-auto}



## Para profundizar

- [The Art of Command Line (github)](https://github.com/jlevy/the-art-of-command-line)
- [Bash guide (github)](https://github.com/Idnan/bash-guide)
- [Codeacademy > Learn the command line](https://www.codecademy.com/courses/learn-the-command-line/lessons/redirection/exercises/sed?action=lesson_resume&link_content_target=interstitial_undefined)


