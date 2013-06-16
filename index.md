---
layout: page
title: mauricioborges.github.io
---
{% include JB/setup %}

That's my website here at github. Enjoy it. I promisse it'll be pretty someday.

# TODO

* improve site to multilang support
* create template for qa, cm and dev pages

# My posts

<ul class="posts">
  {% for post in site.posts %}
	  {% unless post.draft %}
	    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
	  {% endunless %}
  {% endfor %}
</ul>
