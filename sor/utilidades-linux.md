---
layout: article
title: Utilidades Linux
subtitle: Algunos fragmentos de código
date: 2017-12-01
hidden: true
---

## Recursos

- [Awesome Shell](https://github.com/chubin/awesome-shell)
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line)
- [Bash guide](https://github.com/Idnan/bash-guide)


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


## Servicios vía terminal


### Consulta el tiempo - [wttr.in](https://github.com/chubin/wttr.in).

```bash
curl wttr.in           # Localización automática
curl wttr.in/Madrid    # Busca una ciudad
curl wttr.in/Madrid?0  # Sólo el tiempo actual con ?0
```

![Madrid en wittr.in]({{ site.baseurl }}{% link /assets/wittr.in-Madrid.png %})
