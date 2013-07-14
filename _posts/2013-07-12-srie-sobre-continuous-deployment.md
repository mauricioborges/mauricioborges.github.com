---
layout: post
title: "Series about Continuous Deployment"
description: ""
category: 
draft: true
tags: [continuous deployment]
---
{% include JB/setup %}

So today I decided to create a post series about deployment pipeline implementation. I've decided to write about it because currently I've been struggling on implementing some tools and techniques, as continuous integration and deployment and infrastructure as code, and I was feeling like plate juggling alone through development and infraestructure. I'll try to do a PoC (Proof of Concept) using real tools with a (similar to) real case. Of course I'll use dummy data and dummy names, without revealing business information about jobs that I have or had.

I took this idea from the book [Continuous Delivery](http://amzn.com/0321601912) , which defines the build pipeline pattern. I strongly recommend this book for pragmatic people which deals with software development.

I'll try to update this post as an index to the series. The plan can change, but my initial plan is to deal with:
1. creating a reproductible and versioned POC environment;
1. implementing scalable continuous integration;
1. implementing scalable continuous deployment;
1. (maybe) implementing continuous delivery;

Also, for purpose of documentation and clarity, all the post will probably have the following sections:

* Brainstorming: talking, bullsh\*ing and discussing with myself, firstly, about solutions to the problem;
* Sparse tests: I like to do fast tests, just to be sure that some important resources work;
* Bibliographic references: I like to keep track on this...usually I put it on my Evernote account, but for more organization I'll put everything here;
* Another possibilities which I haven't tested yet: usually I generate a big bunch of information related to the subject that I haven't tested but which could work (or not). I'try to write it too, in a free form;
* Deliberately imposed limitations: some imposed strong limitations that I create, to be sure that I'not "happy pathing" anything. Some suggestions: old version of application server, Windows as server, products without easy automation and scripting tools...

Also, I would like to try a "TDD" approach, defining firstly the way that I'll test (with scripts) and then the solution.

# The problem

A common situation when trying to solve a problem based on a simple example. So if I do the happy path only, this experience won't be so valid. Also, as a software developer will be funnier for me to try a real software solution, instead of a dummy one.

Well, my idea is already on my [github account](https://github.com/mauricioborges/tag-cloud-legislacao) . I started it after the [manifestations and strikes](http://pt.wikipedia.org/wiki/Protestos_no_Brasil_em_2013) started in [my country](http://pt.wikipedia.org/wiki/Brasil). Basically, my idea would be to process and provide the government projects and laws, provided mainly as web services, in a more fashioned and ivxznteresting way, grouping per subjects. I believe that it could be a way to reach more people on reading about our government decisions.

Also, I would like to use some approaches and technologies, just because I am currently involved with them in any of my projects. You can call it "non-functional requirement" or whatever you want, but I wouldn't do it. I would call it "use this if I feel it's necessary" requirements:
* try to use Oracle WebLogic 10g3
* try to use Oracle DB
* try to use Amazon EC2

Except for these requirements, I'll force myself on using opensource always. Also, trying to reproduce a corporative environment, I'll use any ticket system.

Ok, maybe it makes more sense in my head than in words, I'll review this post later.

# TODO:

* plate juggling image
* dummy data image
* continuous delivery book image
* create a disqus account
* write a post about open data in brazil and some tests on it
