---
layout: article
title: Jekyll
subtitle: Generador de sitios estáticos
---


Existiendo una [web oficial de Jekyll](https://jekyllrb.com/), ¿qué haces mirando esta página?.<br>
-- Pues para comentarlo en clase.<br>
-- Ah, pues ok.

## Instalación

En Ubuntu:

    $ sudo apt-get install jekyll


## Configuración básica

Para crear un nuevo sitio llamado `mysite` (por lo que más quieras, ¡cambia el nombre!):

    $ jekyll new mysite
    $ cd mysite

La configuración principal del sitio está en el fichero `_config.yml`. Edítalo a tu gusto:

```yml
title: Titulitis Titilante
email: roedor@ipfs.universe
description: "Esto te va a destruir"
baseurl: "" # the subpath of your site, e.g. /blog
url: "" # the base hostname & protocol for your site, e.g. http://example.com
[...]
```


## This is where the magic happens

Just do this:

    $ jekyll build

Esto crea el directorio `_site`.<br>
-- Suena a que es donde se genera el sitio, ¿verdad?<br>
-- Es que es donde se genera el sitio. Verdad.

Venga, venga. Abre el fichero `_site/index.html` con un navegador.<br>¿Ves? No muerde.

Ahora, prueba esto:
- Crea un nuevo fichero nuevo en el directorio principal del sitio, con extensión `.md`. (Venga, escribe algo interesante y luego vuelves, anda.)
- No, en serio, escribe algo menos aburrido que *Holaaaaa zzz...*
- Ejecuta de nuevo `jekyll build` y comprueba que se ha creado en `_site`.

Es más, crea un nuevo fichero markdown dentro de una carpeta (en el directori principal, no en `_site`), pongamos `PulpFiction/burger.md`. Vuelve a generar el sitio, et voilà! Ya puedes verla en HTML.


## ¿Pero qué ha ocurrido?

Este es el asunto:

1. Creas un sitio en Jekyll (y lo configuras como quieras).
2. Tú escribes en **Markdown** las cosas más *mindblowing* que se te ocurran.
3. Jekyll te genera el sitio HTML estático, and life's good.

Suena sencillo, pero lo puede ser aún más con lo siguiente.


## Show me some action, please!

Of course, just do this thing and watch the magic:

    $ jekyll serve

Ex importante **leer**, repito, **leer** la salida de los comandos que escribimos. ¿Ves algo interesante, digamos `Server address: http://...`?

➜ ¿Y qué haces que aún no lo has abierto?

> Weehhh tampoco es que haga falta leer detalladamente todo lo que pare un comando. Con el tiempo aprendes a localizar lo que te puede interesar. Como ya te debería pasar con `ifconfig`, ¿no? Al principio cuesta, I give you that.

Espera, espera. ¿Recuerdas el fichero `PulpFiction/burger.md` que creamos más arriba? Lo tienes en <http://localhost:4000/PulpFiction/burger.html>.


Esto de `jekyll serve` es lo que nos permite realizar el **desarrollo de la web** en nuestro propio entorno. Cuando queramos subirlo a un servidor web, simplemente subimos los contenidos de `_site`.

- Pruébalo en **nginx**
- Y también en **Windows Server**


> That's all, folks!

---

## Subir a una GitHub Pages

To be done...