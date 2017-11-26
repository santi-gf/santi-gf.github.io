---
layout: article
title: Jekyll
subtitle: Generador de sitios estáticos
date: 2017-11-25
---

<style>
  .hyde {
    text-align: right;
    color: #454354;
    border-right: 2px solid #C5B5D1;
    border-radius: 2px;
    padding: 5px 10px 5px 8rem;
    font-size: 0.8rem;
    text-shadow: 0px 1px 0px #FEF8FF;
    color: #A8A2AB;
  }
  
  .hyde h1 {
    font-size: 1rem;
    color: #635C65;
    margin-top: 0px;
  }
  
  #hydeimg {
    max-width: 300px;
  }
  
</style>


<div class="hyde">
<h1>El extraño caso de Dr. Jekyll y Mr. Hyde</h1>
<p>—R. Louis Stevenson (1986)</p>
</div>

<!-- Si la imagen tiene el tamaño final (~300px), se ve borrosa en iOS. Por eso uso una más grande. -->
![Dr. Jekyll y Mr. Hyde](/assets/jekyll.png){:.centerblock #hydeimg}


## Sobre Jekyll

Jekyll es una aplicación de terminal que permite generar un sitio web estático a partir de un código fuente escrito en Markdown.

Echa un vistazo a la [web oficial de Jekyll](https://jekyllrb.com/).



## Instalación

“Tengo una gran aversión a eso de hacer preguntas; se asemeja a la fatalidad del Juicio Final.”
{:.hyde}

En Ubuntu:

    $ sudo apt-get install jekyll


## Configuración básica

“No, señor, tengo por norma que cuanto más sospechosa me parece una cosa, menos preguntas hago.”
{:.hyde}

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

“Plantear una pregunta es como lanzar una piedra. Se sienta uno tranquilamente en lo alto de una colina y allá va la piedra, poniendo en marcha a las demás.”
{:.hyde}

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

Es más, crea un nuevo fichero markdown dentro de una carpeta (en el directori principal, no en `_site`), pongamos `DrJekyll/MrHyde.md`. Vuelve a generar el sitio, et voilà! Ya puedes verla en HTML.



## ¿Pero qué ha ocurrido?


“Una cosa es mortificar la curiosidad, y otra vencerla.”
{:.hyde}

Este es el asunto:

1. Creas un sitio en Jekyll (y lo configuras como quieras).
2. Tú escribes en **Markdown** las cosas más *mindblowing* que se te ocurran.
3. Jekyll te genera el sitio HTML estático, and life's good.

Suena sencillo, pero lo puede ser aún más con lo siguiente.


## Show me some action, please!

“Y si soy el mayor de los pecadores, soy también la mayor de las víctimas.”
{:.hyde}


Of course, just do this thing and watch the magic:

    $ jekyll serve

Ex importante **leer**, repito, **leer** la salida de los comandos que escribimos. ¿Ves algo interesante, digamos `Server address: http://...`?

➜ ¿Y qué haces que aún no lo has abierto?

> Weehhh tampoco es que haga falta leer detalladamente todo lo que pare un comando. Con el tiempo aprendes a localizar lo que te puede interesar. Como ya te debería pasar con `ifconfig`, ¿no? Al principio cuesta, I give you that.

Espera, espera. ¿Recuerdas el fichero `DrJekyll/MrHyde.md` que creamos más arriba? Lo tienes en <http://localhost:4000/DrJekyll/MrHyde.html>.


Esto de `jekyll serve` es lo que nos permite realizar el **desarrollo de la web** en nuestro propio entorno. Cuando queramos subirlo a un servidor web, simplemente subimos los contenidos de `_site`.

- Pruébalo en **nginx**
- Y también en **Windows Server**


---

## Subir a una GitHub Pages

To be done...


<b>I. Peterson:</b> What are you going to do?<br>
<b>Dr. H. Jekyll:</b> Something so simple. I'm going to put an end to all that confusion.<br>
<b>Mr. E. Hyde:</b> You're looking for a man named Hyde.<br>
<b>Dr. H. Jekyll:</b> Hyde? I'M DR. HENRY JEKYLL!!
{:.hyde style="text-align: left; padding-left: 5rem;"}


---

{::options parse_block_html="true" /}
<div style="font-size: 0.75rem; opacity: 0.5;">
Créditos
Imagen: [Jonathan Silva](http://www.johnny5ive.com) en [Behance](https://www.behance.net/gallery/14998873/Dr-Jekyll-Mr-Hyde).
</div>