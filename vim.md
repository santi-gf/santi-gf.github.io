---
layout: article
title: El editor vi
---
<style>
  img {
    margin: auto;
  }
</style>
El editor `vi` data de los comienzos de UNIX, pero el `vim` (*vi improved*) es un editor muy completo usado por muchos programadores y administradores a nivel profesional. La pega que tiene es que la barrera para comenzar a usarlo es muy alta. Sin embargo, conocer los principios básicos de su uso mínimo es muy sencillo y aporta una considerable ventaja para trabajar también con otros editores gráficos.

Vim puede editar ficheros enormes (GB si te pones) sin despeinarse.


## Editor modal

Según abrimos `vim`, aparece un mensaje como el siguiente:


![Salida del comando ls -alh]({{ site.baseurl }}{% link /assets/vim-intro.png %})

Tanto el texto como las `~` no son texto del fichero, 
sino relleno con información que también permite ver dónde acaba el fichero.


Vim es un editor modal, que resulta el gran elemento de confusión para los que no lo conocen de entrada. Tiene dos modos principales:

- **Modo normal**:  por el que comienza según lo abrimos, y permite escribir teclas que realizan acciones, pero no escriben texto.
- **Modo de inserción**: en este modo escribimos texto hasta pulsar la *tecla de oro*: <kbd>ESC</kbd>.


## Uso super mínimo

Pulsando la tecla <kbd>i</kbd> comienzas a escribir.

Con la tecla <kbd>ESC</kbd> vuelves al modo normal.

Guardas el fichero con `:w` y sales con `:q` (o todo junto `:wq`).


## Comandos

Para algunas acciones necesitamos escribir un comando, para lo cual tenemos que entrar en este modo con la tecla <kbd>:</kbd>. En cuanto la pulsas, verás que en la parte inferior de la consola aparece escrita. Aquí nos permite escribir comandos como:

- `:q`: cierra el editor. Si no se han guardado los cambios, no deja salir.
- `:q!`: cierra el editor de manera forzada sin guardar el fichero. 
- `:w`: guarda los cambios en el fichero.
- `:w filename`: guarda los cambios en el fichero con el nombre indicado.
- `:wq`: guarda el fichero y cierra.


## Teclas especiales

Para comenzar a introducir texto pasando a modo inserción:
- <kbd>i</kbd>: insertar justo después del cursor
- <kbd>a</kbd>: insertar justo después del cursor
- <kbd>I</kbd>: insertar al comienzo de la línea
- <kbd>A</kbd>: insertar al final de la línea

Si editamos algo a mitad de una línea (con <kbd>i</kbd>) y queremos seguir editando al comienzo, lo más rápido es pulsar <kbd>ESC</kbd><kbd>I</kbd>.


Movernos por una línea:
- <kbd>0</kbd>: se mueve al primer caracter
- <kbd>$</kbd>: se mueve al final de la línea

Movernos por el fichero:
- Con los cursores
- <kbd>g</kbd><kbd>g</kbd>: se mueve a la primera línea
- <kbd>G</kbd>: se mueve a la última línea
- <kbd>Ctrl</kbd><kbd>d</kbd> (down): avanza una página hacia abajo
- <kbd>Ctrl</kbd><kbd>u</kbd> (up): avanza una página hacia abajo

Copiar y pegar:
- <kbd>yy</kbd>: (yank yank) copia la línea actual
- <kbd>5yy</kbd>: igual pero con 5 líneas (sirve para cualquier número)
- <kbd>dd</kbd>: primero copia y luego borra la línea actual
- <kbd>5dd</kbd>: igual pero con cinco líneas (sirve para cualquier número)
- <kbd>p</kbd>: pega el texto copiado en la linea siguiente a la del cursor. Puedes pulsar esta tecla varias veces para pegar varias líneas seguidas.


Deshacer:
- <kbd>u</kbd>: *undo*.

Buscar texto:
- `/texto`: busca lo que indiques
- <kbd>n</kbd>: (*next*) avanza a la siguiente ocurrencia de lo buscado.
- <kbd>N</kbd>: va a la ocurrencia previa.


## Salvar como root

Este escenario es muy común: abro Vim para editar un fichero de configuración, hago los cambios, y al guardar me doy cuenta de que el permiso de escritura sólo es para el *root*, ¡y no puedo guardar los cambios que ya he hecho! De hecho sólo podemos salir de Vim sin guardar los cambios con `:q!`

Una solución podría ser guardarlo en otro fichero en nuestro *home*, por ejemplo, salir de Vim, y moverlo al fichero original con la terminal usando `sudo mv`.

Pero podemos elevar los permisos de Vim a sudo para que haga directamente la escritura:
```bash
:w !sudo tee %
```

