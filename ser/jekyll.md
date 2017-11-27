---
layout: article
title: Jekyll
subtitle: Generador de sitios estáticos
date: 2017-11-25
---

<style>
  .hyde {
    text-align: right;
    border-right: 2px solid #C5B5D1;
    border-radius: 2px;
    display: block;
    margin-left: auto;
    margin-right: 0px;
    padding: 5px 10px;
    max-width: 390px;
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
  #ornamento {
    max-width: 8rem;
  }
</style>


<div class="hyde">
<h1>El extraño caso de Dr. Jekyll y Mr. Hyde</h1>
<p>—R. Louis Stevenson (1886)</p>
</div>

{% comment %}
  Si la imagen tiene el tamaño final (~300px), se ve borrosa en iOS. Por eso uso una más grande.
{% endcomment %}
![Dr. Jekyll y Mr. Hyde](/assets/jekyll/jekyll.png){:.centerblock #hydeimg}


## Te presento a Jekyll

<b>I. Peterson:</b> What are you going to do?<br>
<b>Dr. H. Jekyll:</b> Something so simple. I'm going to put an end to all that confusion.<br>
<b>Mr. E. Hyde:</b> You're looking for a man named Hyde.<br>
<b>Dr. H. Jekyll:</b> Hyde? I'M DR. HENRY JEKYLL!!
{:.hyde style="text-align: left;"}

<!-- {:.hyde style="text-align: left; padding-left: 5rem;"} -->

Jekyll es una aplicación de código abierto [desarrollada por GitHub](https://jekyllrb.com/), y permite generar un sitio web estático a partir de un código fuente escrito en Markdown.

Hoy en día es importante la velocidad (venga, ¡cuéntame algo que no sepa!), y tener un sitio web estático es mucho más --pero mucho más-- veloz que un sitio web dinámico (Wordpress etc.) Con Jekyll, **Google te va a amar**.

Pero claro, Jekyll sólo lo sabe usar el selecto club de los <s><i>frik...</i></s> desarrolladores <3.

## Instalación

“Tengo una gran aversión a eso de hacer preguntas; se asemeja a la fatalidad del Juicio Final.”
{:.hyde}

En Ubuntu, simplemente:

    $ sudo apt-get install jekyll


## Configuración básica

“No, señor, tengo por norma que cuanto más sospechosa me parece una cosa, menos preguntas hago.”
{:.hyde}

Para crear un nuevo sitio llamado `mysite` (por lo que más quieras, ¡cambia ese nombre!):

    $ jekyll new mysite
    $ cd mysite

La configuración principal del sitio está en el fichero `_config.yml`. Edítalo a tu gusto:

```yml
title: Titulitis Titilante
email: roedor@ipfs.universe
description: "Esto te va a destruir"
[...]
```


## Who is Mr. Hyde?

{% comment %}
“Plantear una pregunta es como lanzar una piedra. Se sienta uno tranquilamente en lo alto de una colina y allá va la piedra, poniendo en marcha a las demás.”
{:.hyde}
{% endcomment %}

“...y bien entrada una infausta noche, combiné los elementos, observé cómo hervían y humeaban en la vasija, y cuando cesó la ebullición, en un inusitado arranque de valor, me bebí la pócima de un trago.”
{:.hyde}

Si quieres conocer a Mr. Hyde:

    $ jekyll build

> Jekyll se ha tomado su poción y se ha transformado en Mr. Hyde.

➜ **Ejecuta `jekyll build` <u>siempre</u> desde el directorio principal del sitio!!! (el que creaste con `jekyll new`)**

Se ha creado el directorio `_site`.<br>
-- Suena a que es donde se genera el sitio, ¿verdad?<br>
-- Es que es donde se genera el sitio.

Venga, venga. Abre el fichero `_site/index.html` con un navegador.<br>¿Ves? No muerde *(aunque no te culpo: el verdadero Mr. Hyde sí)*.

Ahora, prueba esto:
- Crea un nuevo fichero en el directorio principal del sitio, con extensión `.md`.
- En las primeras líneas pon algo como lo siguiente para que Jekyll le aplique la plantilla correspondiente y lo transforme a HTML.
```yaml
---
layout: default
title: "Título de esta página"
---
```
- Tras ello, escribe algo interesante en Markdown.
- No, en serio, escribe algo menos aburrido que *Holaaaaa zzz...*
- Ejecuta de nuevo `jekyll build` y comprueba que se ha creado en `_site`.

Es más, crea un nuevo fichero markdown dentro de una carpeta (en el directori principal, no en `_site`), pongamos `DrJekyll/MrHyde.md`. Vuelve a generar el sitio, *et voilà!* Ya puedes verla en HTML.



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

Es importante **leer**, repito, **leer** la salida de los comandos que escribimos. ¿Ves algo interesante, digamos `Server address: http://...`?

➜ ¿Y qué haces que aún no lo has abierto?

> Weehhh tampoco es que haga falta leer detalladamente todo lo que pare un comando. Con el tiempo aprendes a localizar lo que te puede interesar.

Espera, espera. ¿Recuerdas el fichero `DrJekyll/MrHyde.md` que creamos más arriba? Lo tienes en <http://localhost:4000/DrJekyll/MrHyde.html>.


Esto de `jekyll serve` es lo que nos permite realizar el **desarrollo de la web** en nuestro propio entorno. Cuando queramos subirlo a un servidor web, simplemente subimos los contenidos de `_site`.

- Pruébalo en **nginx**
- Y también en **Windows Server**


---

## Publicar GitHub Pages

“...y en mi caso, ser tentado, aunque fuera levemente, suponía caer.”
{:.hyde}

En tu cuenta de GitHub, [configura un repositorio como página de GitHub](https://guides.github.com/features/pages/). Tras esto:

- Puedes poner ficheros `.html` y `.css` para que se muestren.
- Puedes usarlo como web de Jekyll.

Adivina cuál de los dos puntos anteriores vamos a hacer *(guiño-guiño-codazo-codazo)*.

1. Antes de nada, instala `git` en tu máquina:
```bash
$ sudo apt-get install git
```

2. Crea en la página de GitHub un repositorio con el nombre que va a tener tu web `<user-name>.github.io`.

3. Luego [clona el respositorio de GitHub](https://help.github.com/articles/cloning-a-repository/) en tu máquina:
```
$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
```

4. Con esto se crea un directorio con el nombre de tu repositorio. Copia en él todos los ficheros que tenías en el directorio que tenías con Jekyll.

5. Comprueba que todo funciona en tu máquina local correctamente haciendo `jekyll build` y comprobando que no indique errores.

6. Para subirlo a GitHub, realiza lo siguiente:
```bash
$ cd /ruta/de/tu/username.github.io
$ git add *
$ git commit -m "Mis cambios en la web"
$ git push
```

¡Y ya está! Con esto has subido tu página a uno de los mejores servidores de alojamiento web estático de la actualidad. Mira tu web en:

> *http://YOUR-USERNAME.github.io*

Tras realizar cualquier cambio a tus ficheros en Markdown, sólo necesitas realizar los comandos del último paso, y la web se actualiza automáticamente. ¡Pruébalo!


![Ornamento](/assets/jekyll/Ornament.png){:.centerblock #ornamento}


“No es que pensara en resucitar a Hyde; la simple idea de hacer eso me asustaba hasta el paroxismo: no, era mi propia persona la que una vez más estaba tentada de jugar con mi conciencia; y a escondidas, como un vulgar pecador, fue como acabé cediendo a los asaltos de la tentación.”
{:.hyde}

Aquí damos por concluido este viaje por el mundo del Dr. Jekyll y Mr. Hyde, donde la dualidad de la naturaleza humana se nos muestra en un crudo semblante.

---


Créditos imagen: [Jonathan Silva](http://www.johnny5ive.com) en [Behance](https://www.behance.net/gallery/14998873/Dr-Jekyll-Mr-Hyde). Ornamento de [Freepik](https://www.freepik.com/free-vector/ornamental-elements-collection_1188382.htm).
{:style="font-size: 0.75rem; opacity: 0.5;"}



{% comment %}

Citas del libro
---------------

“Pero la tentación de un descubrimiento tan singular y profundo superó finalmente cualquier asomo de alarma.”

“Fue en la faceta moral, y en mi propia persona, donde aprendí a reconocer la completa y primitiva dualidad del hombre; me di cuenta de que, de las dos naturalezas que luchaban en el campo de batalla de mi conciencia, aun cuando podía decirse con razón que yo era cualquiera de las dos, ello se debía únicamente a que era radicalmente ambas”

“Supongo que cuando un borracho razona consigo mismo acerca de su vicio, ni una sola vez entre quinientas se siente afectado por los peligros que le hace correr su brutal insensibilidad física”

{% endcomment %}
