---
layout: article
title: Utilidades Linux
subtitle: Algunos fragmentos de código
date: 2017-12-01
hidden: true
---


## Twitest

Este código permite comprobar si existe o no una cuenta de Twitter. Guárdalo en un fichero llamado `twitest`.

```bash
#!/usr/bin/env bash

account=$1
status=`curl -s --head https://twitter.com/$account | head -n 1 | cut -d' ' -f2`
echo $status $account
```

Da permisos de ejecución al fichero:

    $ chmod u+x twitest

Y ejecútalo:

    $ ./twitest username
