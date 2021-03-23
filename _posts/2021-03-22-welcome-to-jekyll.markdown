---
layout: post
title:  "CUPID – a história de fundo!"
date:   2021-03-22 15:13:55 +0000
categories: dan north CUPID SOLID
---
Há alguns dias li este [artigo do Dan North](https://dannorth.net/2021/03/16/cupid-the-back-story/) no qual ele contextualiza o porquê de ele [ainda não concordar](https://twitter.com/tastapod/status/1371962740265324544?s=20) com [SOLID](https://pt.wikipedia.org/wiki/SOLID). Gostei bastante do post e gostaria que mais pessoas tivessem acesso ao mesmo então pedi autorização dele para traduzir o mesmo. A tradução está abaixo, caso você identifique algum problema, por favor entre em contato comigo :):



# CUPID - a história de fundo!*

> "Se você precisasse sugerir alguns princípios para o desenvolvimento de software moderno, quais você escolheria?"

Num encontro virtual recente do [Extreme Tuesday Club](https://www.extremetuesday.com/) (XTC, em português, Clube Extremo de Terça), estávamos discutindo [se os princípios de SOLID estariam porventura ultrapassados](https://www.meetup.com/eXtreme-Tuesday-Club-XTC/events/xhgncsyccfbdb/). Algum tempo antes disso, fiz uma apresentação por assim dizer "controversa" do tópico então a organização pediu que eu listasse, antes do encontro, quais princípios do SOLID eu substituiria, já que eu discordei deles. Venho pensando nisso há um tempo e propus cinco deles, formando o acrônimo CUPID (do inglês, cupido).

Este artigo não é sobre estes princípios, este vai ser um próximo post. Este artigo é sobre as razões pelas quais eu acredito que preciso deles. Quero compartilhar a história de fundo e explicar porque eu nunca realmente fui convencido pelo SOLID. Para tanto, vou falar sobre a tal apresentação.

## Why every single element of SOLID is wrong

[PubConf](https://pubconf.io/) was invented as a kind of afterparty to the NDC conferences. As the name suggests, it takes place in a pub. Several speakers give an Ignite-style talk – 20 slides, 15 seconds per slide, auto-advancing – and the audience roars, stamps, claps and thunders its approval accordingly. The winner gets something and everyone has a great time.

A few years ago I was invited to speak at a PubConf event in London. I like the challenge of a constrained talk. This one had to be drunk-people funny and Ignite-shaped. I had been thinking about Robert C. Martin’s [SOLID principles](https://www.baeldung.com/solid-principles), and in the spirit of “it depends” I thought it would be fun to see whether I could refute each principle with a straight face. I also wanted to propose an alternative in each case.

Now some talks write themselves: I figured I could use one slide to introduce each principle, one to challenge it, one to pitch an alternative, five times. That’s 15 slides, with 45 seconds per principle. Top-and-tail it, and there were my 20 slides!

As I wrote the talk I noticed two things. First, it was much easier to refute each principle than I thought (apart from Liskov’s Substitution Principle, so I had to tackle that a different way). Second, the alternative kept turning out to be the same thing: Write simple code. It is easy to challenge that with “What does ‘simple’ even mean?” but I had a good working definition for that so I wasn’t too worried.

After the conference I put [the slides up on SpeakerDeck](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong) and a whole load of people I have never met started attacking first the premise of the talk, then the detail of slides from a talk they never heard me give, then [me personally](https://www.entropywins.wtf/blog/2017/02/17/why-every-single-argument-of-dan-north-is-wrong/).

Since I’ve never written it up, here is roughly how the talk went. Bear in mind that for each principle, I had 15 seconds to introduce it, 15 seconds to challenge it, and 15 seconds to propose an alternative. Ready? Go!



### Single Responsibility Principle

The Single Responsibility Principle says that code should only do one thing. Another framing is that it should have “one reason to change”. I called this the “Pointlessly Vague Principle”. What is one thing anyway? Is ETL – Extract-Transform-Load – one thing (a `DataProcessor`) or three things? Any non-trivial code can have any number of reasons to change, which may or may not include the one you had in mind, so again this doesn’t make much sense to me.

Instead I suggested to *write simple code* using the heuristic that it “Fits In My Head”. What does that mean? You can only reason about something if it fits in your head. Conversely, if something doesn’t fit in your head, you can’t reason about it. Code should fit in your head at any level of granularity, whether it is at method/function level, class/module level, components made up of classes, or entire distributed applications.

You might ask “Whose head?” For the purpose of the heuristic I assume the owner of the head can read and write idiomatic code in whichever languages are in play, and that they are familiar with the problem domain. If they need more esoteric knowledge than that, for instance knowing which of the many undocumented internal systems we need to integrate with to get any work done, then that should be made explicit in the code so that it will fit in their head.

At each scale there should be enough conceptual integrity that you can grasp “the whole” at that level. If you can’t, then that is a heuristic to strive for in your restructuring activities. Sometimes you can bundle several things together and they still fit in your head. The bundling even makes them easier to reason about than if they are artificially split out because someone insisted on Single Responsibility. In other cases, it makes sense to decompose a single responsibility artificially into several steps just to make each one easier to reason about.

### Open-Closed Principle

This is the idea that code should be open for extension, i.e. easy to extend without changing, and closed for modification, i.e. you can trust what it does so you don’t need to go in and tinker with it.

This was sage advice in an age where code was:

* **expensive to change:** Try making a small change and then compiling and linking a few million lines of C++ in the 1990s. I’ll wait.
* **risky to change**, because we hadn’t figured out [refactoring](https://www.refactoring.com/) yet, never [mind refactoring IDEs](https://www.jetbrains.com/) (outside of Smalltalk) or [example-guided programming](https://www.martinfowler.com/bliki/TestDrivenDevelopment.html).
* **mostly additive**: You would write some code, check it in (if you were down with the kids and using a version control system like RCS or SCCS), and then move on to the next file. You were translating the detailed functional spec into code, one lump at a time. Renaming things was uncommon; renaming files doubly so. CVS, which became the ubiquitous source control system, would literally forget the entire history of a file if you renamed it, it was such an uncommon activity. This is easy to overlook in an age of automated refactoring, and changeset-based version control.

Nowadays, the equivalent advice if you need code to do something else is: Change the code to make it do something else! It sounds trite, but we think of code as malleable now [like clay](https://www.artima.com/articles/working-the-program), where in the Olden Days the metaphor was more like building blocks. There was no feedback loop between The Spec and The Code like we have with automated examples.

In this case I railed against the “Cruft Accretion Principle”. Code is not an “asset” to be carefully shrink-wrapped and preserved, but a cost, a debt. All code is cost. So if I can take a big pile of existing cost and replace it with a smaller more specific cost, then I’m winning at code! *Write simple code* that is easy to change, and you have code that is both open and closed, however you need it.



\* Tradução do post publicado em 16 de março de 2021 no blog do Dan North com o título ["CUPID - THE BACK STORY"](https://dannorth.net/2021/03/16/cupid-the-back-story/)
