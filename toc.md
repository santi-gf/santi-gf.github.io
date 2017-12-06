---
layout: page
title: "Contenidos de la web"
hidden: true
---

{% assign num_pages = site.pages | where:"layout","page" | size %}
{% if num_pages > 0 %}

## Páginas

<ul>
{% assign pages_list = site.pages | where:"layout","page" | sort:"url" | sort:"hidden" %}
{% for node in pages_list %}
  <li>{% if node.hidden == true %}[oculto] {% endif %}<a href="{{ site.baseurl }}{{ node.url }}">{{ node.title }}</a></li>
{% endfor %}
</ul>

{% endif %}


{% assign num_pages = site.pages | where:"layout","article" | size %}
{% if num_pages > 0 %}

## Artículos

<ul>
{% assign pages_list = site.pages | where:"layout","article" | sort:"url" | sort:"hidden" %}
{% for node in pages_list %}
  <li>{% if node.hidden == true %}[oculto] {% endif %}<a href="{{ site.baseurl }}{{ node.url }}">{{ node.title }}</a></li>
{% endfor %}
</ul>

{% endif %}
