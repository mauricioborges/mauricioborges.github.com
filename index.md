---
layout: page
title: mauricioborges.github.com
---
{% include JB/setup %}

# Intro

TODO

# Meus posts

<ul class="posts">
  {% for post in site.posts %}
	  {% unless post.draft %}
	    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
	  {% endunless %}
  {% endfor %}
</ul>
