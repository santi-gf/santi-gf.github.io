---
layout: article
title: Node.js
subtitle: Usando Node.js como el novato que soy
date: 2017-12-08
hidden: true
---


Vale, lo confieso: estoy escribiendo esta misma línea sobre Node.js sin tener ni idea ni de cómo se instala. Pero de eso va la cosa, de anotar las cosas que me van surgiendo. Esto tiene un doble propósito:

1) Yo tengo mis apuntes
2) Puede que si también estás empezando, te resulte útil tener las impresiones de alguien que está tan pez como tú.

Mi duda es: ¿Actualizaré algún día el subtítulo de esta página?

Pero en serio, [esta web de risingstack](https://blog.risingstack.com/node-hero-tutorial-getting-started-with-node-js/) es la que me está ayudando de verdad.


- Para empezar, me ha gustado [este tutorial de risingstack](https://blog.risingstack.com/node-hero-tutorial-getting-started-with-node-js/).
- Una vez tengas algo de base, [este tutorial de parseobjets.com](http://parseobjects.com/nodejs-project-with-express-handlebars-and-mongoose/) es un súper empujón que concentra muy bien la creación de una web con Node.js, Bootstrapp y MongoDB.


## Uso básico

Instalar (en macOS):

    $ brew install node

Esto instala dos comandos que puedes probar:

    $ node --version
    $ npm --version

Para comenzar un nuevo proyecto, no es necesario pero sí conveniente lo siguiente:

    $ npm init

Esto ayuda a crear el fichero `package.json`, con información sobre el proyecto, que ayuda a la automatización de la aplicación en entornos como servidores o sitios PaaS. Tras ello, añade manualmente la línea de `start` como en el siguiente ejemplo:

```json
{
  "name": "Mi aplicación",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node index.js"
  },
  "author": "Santiago González",
  "license": "MIT"
}
```

De esta forma, en vez de preguntarnos cuál es el fichero de arranque para ejecutarlo con `node index.js`, lo podremos ejecutar escribiendo simplemente:

    $ npm start




