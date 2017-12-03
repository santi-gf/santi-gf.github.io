---
layout: article
title: "Introducción a HTML"
date: 2017-10-25
---

## Contenidos
{:.no_toc}

* Toc
{:toc}


## Introducción

La estructura principal en el lenguaje HTML es la **etiqueta (*tag*)**, que tiene la siguiente forma:

~~~ html
<etiqueta>contenido</etiqueta>
~~~

Cuando escribimos una etiqueta de apertura con `<etiqueta>`, hay que escribir la etiqueta de cierre `</etiqueta>` después del contenido. Dentro del contenido pondremos texto y otras etiquetas *anidadas*.

Sin embargo, si no hay ningún contenido se puede omitir la etiqueta de cierre escribiendo simplemente `<etiqueta />`. Además, en HTML5 es posible quitar la barra `/`, por lo que las tres siguientes líneas son equivalentes:

~~~ html
<etiqueta></etiqueta>
<etiqueta />
<etiqueta>
~~~

Además, existen **atributos de etiqueta (*attribute*)**, que permiten modificar su comportamiento, y se escriben dentro de la apertura de etiqueta de esta forma:

~~~ html
<etiqueta atributo="valor">
~~~


## Estructura de un documento HTML

La estructura básica es esta:

~~~ html
<!DOCTYPE html>
<html>
  <head>
    <title>Título de la página</title>
  </head>
  <body>
    Contenidos que aparecen dentro de la ventana
  </body>
</html>
~~~

Todas estas etiquetas deben aparecer siempre en una página HTML. Su significado es:

**DOCTYPE**
: Indica que el tipo de documento es HTML. Aparece en la primera línea siempre. LLeva una exclamación, y no lleva etiqueta de cierre.

**html**
: Contiene absolutamente todo el código HTML.

**head**
: Incluye todos los *metadatos* (información no visible) de la página.

**title**
: Es el título de la página que se suele mostrar en la barra superior o en la pestaña del navegador, pero no en el contenido de la página.

**body**
: Incluye todo lo que se muestra como contenido de la página. Es donde pondremos la mayor parte de nuestro código.


## Etiquetas básicas

Las etiquetas nos permiten estructurar el contenido. Algunas básicas son las siguientes:

`<h1>...</h1>`
: Encabezamiento de primer nivel.

`<h2>...</h2>`
: Encabezamiento de segundo nivel. Existen hasta 6 niveles (`<h6>`).

`<p>...</p>`
: Contiene un párrafo de texto.

`<br>`
: Se sitúa dentro de un párrafo para que el texto continúe en la siguiente línea.

`<hr>`
: Añade una barra horizontal para separar contenido.

Las etiquetas `<br>` y `<hr>`, al no necesitar ningún contenido, no hace falta cerrarlas.

Prueba a guardar el siguiente código en un fichero de texto plano llamado `mipagina.html` y ábrelo con un navegador web. Prueba a añadir más etiquetas y comprobar el resultado.

~~~ html
<!DOCTYPE html>
<html>
  <head>
    <title>Título de la página</title>
  </head>
  <body>
    <h1>Encabezado</h1>
    <p>Esto es un párrafo <br> de dos líneas.<p>
  </body>
</html>
~~~

No debes escribir ningún texto sin que esté dentro de alguna etiqueta que lo permita, como la de párrafo `<p>`.

## Listas

Las etiquetas básicas son:

`<ul>`
: *Unordered List*. Lista de puntos.

`<ol>`
: *Ordered List*. Lista numerada automáticamente.

`<li>`
: List Item. Cada uno de los elementos contenidos en la lista.

La forma de escribir listas es el siguiente (prueba a cambiar `<ul>` por `<ol>`):

{% capture mycode %}
<ul>
  <li>Primer punto</li>
  <li>Segundo punto</li>
  <li>Tercer punto</li>
</ul>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Lista no ordenada" %}

Podemos escribir **listas anidadas** de la siguiente forma:

{% capture mycode %}
<ol>
  <li>Primer item</li>
  <li>Segundo item</li>
  <ul>
    <li>Primer item anidado</li>
    <li>Segundo item anidado</li>
  </ul>
</ol>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Listas anidadas" %}


## Formateo de texto

Dentro de un párrafo o alguna etiqueta que contenga texto, puedes darle formato para modificar su aspecto. Por ejemplo:

`<strong>` o `<b>`
: Texto **remarcado**

`<em>` o `<i>`
: Texto en *cursiva (italics)*

`<mark>`
: Texto <mark>resaltado</mark>

`<small>`
: Texto <small>pequeño</small>

`<big>`
: Texto <big>grande</big>

`<del>`
: Texto <del>borrado</del>

`<u>`
: Texto <u>subrayado</u>

`<sub>`
: Texto en <sub>subíndice</sub>

`<sup>`
: Texto en <sup>superíndice</sup>

*Nota:* en HTML5 es preferible usar `<strong>` y `<em>` antes que `<b>` y `<i>`.

Puedes **anidar etiquetas de formato** siempre que respetes el orden de apertura y cierre de etiquetas, como en los siguientes ejemplos:

{% capture mycode %}
<b>Texto en negrita <i>y cursiva</i></b>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" %}

{% capture mycode %}
Texto <mark>resaltado y <b>negrita y <sub>subíndice</sub></b></mark>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" %}


## Enlaces

La etiqueta `<a href="">...</a>` permite poner un hipervínculo o enlace. También se puede poner un enlace para enviar un email o llamar teléfono.

{% capture mycode %}
<a href="https://jekyllrb.com/">
  Visita esta web
</a>
<br>
<a href="mailto:persona@dominio.com">
  Envíame un email
</a>
<br>
<a href="tel:+34 123 456 789">
  Llámame
</a>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Ejemplos de enlace" %}


## Imágenes

La etiqueta `<img src="...">` permite añadir una imagen. Usa los atributos **src** (*source*) para la URL de la imagen, y **alt** para el texto *alternativo*, que es imprescindible si el navegador no encuentra la URL o para personas con visión reducida. Ambos atributos deben aparecer siempre en esta etiqueta.

Esta etiqueta no necesita ser cerrada, ya que no tiene ningún contenido.

{% capture mycode %}
<img src="http://servidor/imagen.jpg" 
     alt="Texto alternativo">
{% endcapture %}
{% include code-panel.html code=mycode lang="html" skipbody=true header="Imagen referenciada por URL" %}

Si la imagen reside en tu misma máquina, puedes incluirla escribiendo la ruta en la que se encuentra a partir del lugar en el que esté la página *html*. En el siguiente ejemplo, dentro de una misma carpeta tenemos la página web y otra carpeta `imagenes` en la que se encuentra `imagen.jpg`.

{% capture mycode %}
<img src="imagenes/imagen.jpg" 
     alt="Texto alternativo">
{% endcapture %}
{% include code-panel.html code=mycode lang="html" skipbody=true header="Imagen referenciada por fichero" %}


Podemos **cambiar tamaño** con el que se muestra la imagen con los atributos **width (ancho)** y **height (alto)**. Podemos establecer este tamaño:

- En píxeles: `100px`
- En porcentaje respecto al tamaño de la página: `50%`

Pruébalo esto y cambia la anchura de la ventana del navegador.

~~~ html
<img src="http://servidor/imagen"
     alt="Texto alternativo"
   width="400px"
  height="300px">
     
<img src="http://servidor/imagen"
     alt="Texto alternativo"
   width="50%"
  height="50%">
~~~

Los **formatos de imagen** que más se utilizan con `.jpg`, `.png` y `.gif`.

## Tablas

En HTML las tablas se constituyen de filas, y las filas de celdas, como en este ejemplo:

{% capture mycode %}
<table border="1px">
  <tr>
    <th>Columna 1</th>
    <th>Columna 2</th>
    <th>Columna 3</th>
  </tr>
  <tr>
    <td>Celda 1</td>
    <td>Celda 2</td>
    <td>Celda 3</td>
  </tr>
</table>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Tabla básica en HTML" %}


Las etiquetas principales son:

`<table>`
: Crea una tabla.

`<tr>`
: *Table Row*. Añade una fila a la tabla.

`<td>`
: *Table Data*. Añade una celda a la fila. Debe ir siempre dentro de una <tr>.

`<th>`
: *Table Header*. Es una celda usada como cabecera. Por defecto, el navegador generalmente pone los contenidos en negrita y con alineación centrada.

Para **combinar celdas** (juntarlas) existen los atributos `colspan` y `rowspan`. Se utilizan de la siguiente forma:

{% capture mycode %}
<table border="1px">
  <tr>
    <td>Celda 1</td>
    <td>Celda 2</td>
  </tr>
  <tr>
    <td>Celda 3</td>
    <td>Celda 4</td>
  </tr>
  <tr>
    <td colspan="2">Celda 5</td>
  </tr>
</table>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Tabla con columnas combinadas" %}


En el siguiente ejemplo con filas combinadas, en la segunda fila sólo debemos incluir dos celdas porque la celda con el `rowspan` ocupará el espacio del tercer hueco.

{% capture mycode %}
<table border="1px">
  <tr>
    <td>Celda 1</td>
    <td>Celda 2</td>
    <td rowspan="2">Celda 3</td>
  </tr>
  <tr>
    <td>Celda 4</td>
    <td>Celda 5</td>
  </tr>
</table>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Tabla con filas combinadas" %}


Estudia este ejemplo más complejo:

{% capture mycode %}
<table border="1px">
  <tr>
    <th>Lun.</th>
    <th>Mar.</th>
    <th>Miér.</th>
    <th>Jue.</th>
    <th>Vie.</th>
  </tr>
  <tr>
    <td rowspan="3">Web</td>
    <td rowspan="2">CSS</td>
    <td colspan="3">Sistemas</td>
  </tr>
  <tr>
    <td colspan="2">HTML</td>
    <td rowspan="2">Web</td>
  </tr>
  <tr>
    <td>HTML</td>
    <td>Redes</td>
    <td>Web</td>
  </tr>
</table>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" header="Tabla con filas y columnas combinadas" %}


## Comentarios

Dentro del código HTML se pueden escribir comentarios que sólo sirven para dejar anotaciones que vea el programador, y que no se mostrarán al abrir la página en un navegador.

Para escribir un comentario se usa la siguiente notación:

~~~ html
<!-- Esto es un comentario -->
~~~

Los comentarios son útiles para marcar secciones cuando tienes un código largo, dejar notas para el futuro o para otros programadores, etc.


## Codificación

En ocasiones la codificación del fichero (*file encoding*) puede dar problemas y hacer que veamos caracteres extraños en el navegador.

Debemos asegurarnos de que la codificación en la que se ha guardado el fichero html es **UTF-8**.

Además, siempre conviene incluir la siguiente línea en el `head` de la página para indicar al navegador la codificación utilizada:

~~~ html
<head>
    <title>Título de la página</title>
    <meta charset="utf-8">
</head>
~~~
