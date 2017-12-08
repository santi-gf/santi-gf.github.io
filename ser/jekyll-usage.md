---
layout: article
title: "Usando Jekyll"
subtitle: Comandos útiles
date: 2017-12-3
hidden: true
---

Esta página sigue tras la [Introducción a Jekyll]({% link ser/jekyll.md %}).


## Enlaces
{% raw %}
Para encontrar el enlace de un post:

```jekyll
{{ site.baseurl }}{% post_url 2010-07-21-name-of-post %}
```

Para encontrar el enlace de cualquier recurso (página, post, fichero...):

```liquid
{{ site.baseurl }}{% link /assets/files/doc.pdf %}
```

Pon cualquiera de estos enlaces en Markdown:

```liquid
[Link]({{ site.baseurl }}{% post_url 2010-07-21-name-of-post %})
[Link]({{ site.baseurl }}{% link /assets/files/doc.pdf %})
```

Echa un vistazo a [Jekyll Templates #links](https://jekyllrb.com/docs/templates/#links).

{% endraw %}

## Tests en Jekyll

Puedes comprobar los enlaces rotos con [HTML Proofer](https://github.com/gjtorikian/html-proofer):

1. Instala HTML Proofer:
```bash
echo "gem 'html-proofer'" >> Gemfile
bundle install
gem install html-proofer
```
2. Añade lo siguiente al archivo `Rakefile`:
```ruby
require 'html-proofer'
task :test do
  sh "bundle exec jekyll build"
  options = { :assume_extension => true }
  HTMLProofer.check_directory("./_site", options).run
end
```
3. Ejecútalo:
```ruby
rake test
```



- [Test your Jekyll blog with Travis CI](https://www.jacobtomlinson.co.uk/jekyll/2015/02/18/test-you-jekyll-blog-with-travis-ci/)




