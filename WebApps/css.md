---
layout: article
title: "Introducción a CSS"
date: 2017-10-25
---

## Contenidos
{:.no_toc}

* Toc
{:toc}


## Introducción

CSS (*Cascading Style Sheets*) es un lenguaje que describe el estilo de un documento HTML, indicando cómo se deben mostrar todos los elementos de la página.

De esta forma, existe una separación completa los **contenidos** de la página (en HTML) y el **estilo** que tienen esos contenidos (en CSS).

Cualquier programación web moderna intenta evitar lo más posible separar contenidos y estilo. Por eso la etiqueta `<font>`, que se utilizaba con frecuencia para aplicar colores, tipografía, etc. se considera **obsoleta y una mala práctica**.


## Sintaxis

CSS se escribe como un conjunto de reglas, cada una de las cuales tiene:

**Selector**
: Indica la etiqueta/s del código HTML a la que se va a aplicar el estilo.

**Decaración**
: Es una modificación de estilo que se aplica al selector. Cada declaración **siempre acaba en punto y coma**.

![Formato del selector CSS](https://www.w3schools.com/css/selector.gif)

El siguiente ejemplo hace que todos los párrafos aparezcan con el texto centrado y de color rojo.

~~~ css
p {
    color: red;
    text-align: center;
}
~~~

## Insertar CSS

Para que el código CSS se aplique a una página HTML, es necesario insertarlo correctamente. Existen tres formas para ello:

- Hoja de estilo externa
- Hoja de estilo interna
- Estilo en línea (*inline*)


La **hoja de estilo externa** es posiblemente la más utilizada y flexible, ya que permite separar por completo el código HTML en un fichero `.html` y el código CSS en un fichero `.css`. Para ello sólo hay que referenciar el fichero CSS desde el HTML de esta manera:

{% capture mycode %}
<head>
  <link rel="stylesheet" href="miestilo.css">
</head>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" skipbody=true header="pagina.html" %}

Y crear el fichero `miestilo.css` que contenga únicamente código CSS:

{% capture mycode %}
p {
  color: red;
}
{% endcapture %}
{% include code-panel.html code=mycode lang="css" skipbody=true header="miestilo.css" %}


La **hoja de estilo interna** se crea añadiendo la etiqueta `<style>` dentro del `<head>` de la página para contener código CSS. Es muy cómodo para trabajos pequeños, y es el que recomendamos para este manual.

~~~ html
<!DOCTYPE html>
<html>
  <head>
    <title>Título de la página</title>
    <style>
      p {
        color: red;
      }
    </style>
  </head>
  <body>
    <p>Este es mi párrafo</p>
  </body>
</html>
~~~


El **estilo *inline*** permite añadir código CSS en el atributo `style` dentro de una etiqueta HTML. Esta forma de incluis estilo **no es recomendable**, ya que rompe la principal función de CSS de separar el contenido del estilo.

~~~ html
<p style="color: red;">Este es mi párrafo</p>
~~~



## Selectores

Existen varios tipos de selectores que podemos utilizar para que nuestro código CSS afecte a ciertas partes del código HTML.

### Seclector de elemento

Poniendo el nombre de una etiqueta HTML, las reglas CSS se aplicarán a **todas las etiquetas de ese tipo** en la página.

{% capture mycode %}
h1 {
    background-color: lightgray;
}
{% endcapture %}
{% include code-panel.html code=mycode lang="css" skipbody=true header="Ejemplo de selector de elemento" %}

### Identificadores
Este tipo de selector se refiere a un elemento único en la página. Se identifica con el atributo *id* en cualquier etiqueta HTML.

{% capture mycode %}
<p id="introduccion">Párrafo de introducción</p>
<p>Otro párafo</p>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" skipbody=true header="Identificador en HTML" %}

**Cada identificador debe ser único** en toda la página. No se debe nunca repetir un identificador en dos etiquetas.

Para hacer referencia a un identificador se utiliza la almohadilla `#` antes de su nombre.

{% capture mycode %}
 #introduccion {
     color: blue;
}
{% endcapture %}
{% include code-panel.html code=mycode lang="css" skipbody=true header="Identificador en CSS" %}

Un identificador **no puede comenzar por un número**, pero puede contenerlos.

Los identificadores no son muchas veces la mejor opción, e incluso hay programadores que opinan que deberían dejar de usarse en CSS para utilizar únicamente clases, que en cualquier caso son la opción más utilizada.


### Clases
Los selectoes de clase permiten seleccionar a todos los elementos marcados con una clase. A diferencia del identificador, que debe ser único en toda la página, **una clase se puede repetir en varias etiquetas**. De esta forma, el código CSS afectará a todas las etiquetas que tengan esa clase.

Para marcar una etiqueta HTML con una clase, se hace de la siguiente manera:

{% capture mycode %}
<p class="mi-clase">Párrafo</p>
{% endcapture %}
{% include code-panel.html code=mycode lang="html" skipbody=true header="Clase en HTML" %}

Para cambiar el estilo de la clase anterior desde CSS se usa el punto `.` antes del nombre de la clase.

<style>
.css-class-example-panel-remarcado {
  color: #fcfcfc;
  background-color: #007849;
}
</style>
{% capture mybody %}
<p class="css-class-example-panel-remarcado">Primer párrafo</p>
<p>Segundo párrafo</p>
<p class="css-class-example-panel-remarcado">Tercer párrafo</p>
{% endcapture %}
{% capture myhtml %}
~~~ html
<p class="remarcado">Primer párrafo</p>
<p>Segundo párrafo</p>
<p class="remarcado">Tercer párrafo</p>
~~~
{% endcapture %}
{% capture mycss %}
~~~ css
.remarcado {
    color: #fcfcfc;
    background-color: #007849;
}
~~~
{% endcapture %}
{% include panel-html-css.html body=mybody html=myhtml css=mycss skipbody=true header="Clase en CSS" %}

Una clase **no puede comenzar por un número**, pero puede contenerlos.


## Colores

Existen unas cuantas formas diferentes de especificar colores en CSS. 

<!-- 

## Fondos

## Modelo de caja

Margin y padding

## Bordes

Anchura y redondeado.

## Fuentes

Google Fonts

-->