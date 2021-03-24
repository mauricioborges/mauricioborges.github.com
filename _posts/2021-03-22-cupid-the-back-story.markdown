---
layout: post
title:  "CUPID – a história de fundo!"
date:   2021-03-22 15:13:55 +0000
categories: dan north CUPID SOLID
---
Há alguns dias li este [artigo do Dan North](https://dannorth.net/2021/03/16/cupid-the-back-story/) no qual ele contextualiza o porquê de ele [ainda não concordar](https://twitter.com/tastapod/status/1371962740265324544?s=20) com [SOLID](https://pt.wikipedia.org/wiki/SOLID). Gostei bastante do post e gostaria que mais pessoas tivessem acesso ao mesmo então pedi autorização dele para traduzir o mesmo. A tradução está abaixo, caso você identifique algum problema, por favor entre em contato comigo :):

O artigo faz referência a alguns links. Alterei estas referências apenas quando havia um artigo *igual* em português, como por exemplo páginas da Wikipédia ou páginas de livros.

# CUPID - a história de fundo!*

> "Se você precisasse sugerir alguns princípios para o desenvolvimento de software moderno, quais você escolheria?"

Num encontro virtual recente do [Extreme Tuesday Club](https://www.extremetuesday.com/) (XTC, em português, Clube Extremo de Terça), estávamos discutindo [se os princípios de SOLID estariam porventura ultrapassados](https://www.meetup.com/eXtreme-Tuesday-Club-XTC/events/xhgncsyccfbdb/). Algum tempo antes disso, fiz uma apresentação por assim dizer "controversa" do tópico então a organização pediu que eu listasse, antes do encontro, quais princípios do SOLID eu substituiria, já que eu discordei deles. Venho pensando nisso há um tempo e propus cinco deles, formando o acrônimo CUPID (do inglês, cupido).

Este artigo não é sobre estes princípios, este vai ser um próximo post. Este artigo é sobre as razões pelas quais eu acredito que preciso deles. Quero compartilhar a história de fundo e explicar porque eu nunca realmente fui convencido pelo SOLID. Para tanto, vou falar sobre a tal apresentação.

## Why every single element of SOLID is wrong

A conferência [PubConf](https://pubconf.io/) foi inventada como uma espécie de *pós-balada* para as conferências [NDC](https://ndcconferences.com/). Como o nome sugere, a PubConf acontece num bar (do inglês, *pub*). Varias palestrantes fazem palestras relâmpago - 20 slides, 15 segundos por slide, trocando de slide automaticamente – e a audiência grita, aplaude, bate palma, toca o terror de acordo. A ganhadora recebe um brinde e todo mundo se diverte.

Alguns anos atrás fui convidado para falar numa edição da PubConf de Londres. Gosto do desafio de uma palestra com restrições. Esta especificamente tinha as restrições do formato relâmpago e das pessaos bêbadas fazendo graça. Eu tenho refletido sobre os [princípios de SOLID](https://www.baeldung.com/solid-principles) do Robert C. Martin e o espírito "tudo depende" inerente aos princípios e achei que seria legal tentar refutar cada princípio de cara limpa. Eu também propus uma alternativa para cada caso.

Algumas palestras se escrevem por si só: Percebi que poderia usar um slide para cada princípio, 1 slide para desafiar tal princípio, um para tentar vender minha alternativa. Cinco vezes. Ou seja, terias 15 slides, com 45 segundos para cada princípio. Uma introdução, uma conclusão, e aí tenho meus 20 slides!

Enquanto eu escrevia a palestra eu percebi duas coisas. A primeira é que é muito mais fácil refutar cada princípio do que eu tinha imaginado (exceto pelo Princípio da Substituição de Liskov, que eu precisei abordar de maneira distinta). A segunda coisa que percebi foi que a alternativa sempre se resumia em: *Escreva código simples*. É fácil desafiar essa alternativa com "Mas o que afinal é 'simples'?? mas eu tinha uma definição aceitável para isso então não estava muito preocupado.

Depois da conferência eu coloquei meus [slides no SpeakerDeck](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong) e um mar de pessoas que eu não conheço começaram em primeiro lugar a atar a premissa da palestra, e então atacaram os slides de uma palestra que eles nunca me viram ministrar, e finalmente começaram a [me atacar pessoalmente](https://www.entropywins.wtf/blog/2017/02/17/why-every-single-argument-of-dan-north-is-wrong/).

Como eu nunca de fato escrevi a palestra, este texto descreve aproximadamente como foi a palestra. Tenha em consideração que tive 15 segundos para introduzir o princípio, 15 segundos para desafiá-lo e 15 segundos para propôr uma alternativa. Preparada? Bora!

### Princípio da Responsabilidade Única (Single Responsibility Principle)

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

### Liskov Substitution Principle

This is just the [Principle of Least Surprise](https://en.wikipedia.org/wiki/Principle_of_least_astonishment) applied to code substitution, and as such is pretty sensible. If I tell you something is a valid subtype of the thing you have, then you should be able to assume it will act the same in any sense that you care about.

However, the language LSP uses of “subtypes”, coupled with the way most developers conflate subtypes with subclasses, and the vagaries of "desirable properties", means that it tends to evoke the class-based inheritance language of *"is-a"* and *"has-a"*, and its corresponding 1980s entity modelling.

In the spirit of using a butter knife as a screwdriver, many objects can *"act-like-a"* or *"sometimes-be-used-as-a"* or *"pass-off-as-a-if-you-squint"*. In this context what we really want is small, simple types that we can compose into whatever more complex structures we need, and to make our peace with all the nuances that go along with that. My advice, *quelle surprise*, is to "write simple code" that is easy to reason about.

### Interface Segregation Principle

This really is fish-in-a-barrel as principles go. For some reason, this one caused the most controversy, but to me it is the easiest to debunk. While [researching](https://en.wikipedia.org/wiki/Interface_segregation_principle) this talk I discovered that this pattern came about when Robert C. Martin was wrangling a [God object](https://en.wikipedia.org/wiki/God_object) in the middle of some printing software at Xerox. Everything was happening in a class called Job. His approach to simplifying it was to find each place where it was used, figure out which methods "went together" and put those in an intermediate interface. This had several immediate benefits:

* Collecting related methods into different interfaces showed all the different responsibilities the `Job` class was performing.
* Giving each interface an intention-revealing name made the code easier to reason about than just passing a Job object around.
* It created the option to break the `Job` class out into smaller classes fronted by each interface. (Arguably they didn’t need the interface any more now.)

All of this makes sense, it's just that it isn't a principle, it is a pattern. A principle is something that is generally good advice in any context: Seek first to understand, then to be understood; Be excellent to each other.

A pattern is a strategy that works in a given context (God class) that has benefits (smaller components) and trade-offs (more separate things to manage). The principle would have been about not getting into that mess in the first place!

Thus I argued that if this were a principle at all, it was the "Stable Door Principle". If you had small, role-based classes in the first place, you wouldn’t be in the position of trying to decompose a huge, tangled mess.

Sure, we may find ourselves in that context from time to time, and when we do, interface segregation is a perfectly cromulent strategy for slicing your way towards sanity, along with building a suite of [characterisation tests](https://michaelfeathers.silvrback.com/characterization-testing) and all of the other advice in Mike Feathers’ brilliant [Working Effectively With Legacy Code](https://www.pearson.com/us/higher-education/program/Feathers-Working-Effectively-with-Legacy-Code/PGM254740.html).

### Dependency Inversion Principle

While there is nothing fundamentally wrong with DIP, I don’t think it is an overstatement to say that our obsession with dependency inversion has single-handedly caused billions of dollars in irretrievable sunk cost and waste over the last couple of decades.

The real principle here is option inversion. A dependency is only interesting when there might be multiple ways of providing it, and you only need to invert the relationship when you believe the wiring is important enough to become a separate concern. That’s quite a high bar, and mostly all you ever need is a `main` method.

If instead you subscribe to the idea that all dependencies should be inverted all the time, you end up with J2EE, OSGi, Spring, or any other "declarative assembly" framework where the structuring of the components is itself a twisty maze of config. J2EE deserves a special mention for deciding that each type of dependency inversion – EJBs, servlets, web domains, remote service location, even the configuration configuration – should be owned by different roles.

In the wild, there are entire shadow codebases where each class is backed by exactly one interface, which only exists to satisfy a wiring framework or to inject a mock or stub for automated testing theatre. The promise of "you can just swap out the database" evaporates as soon as you try to, well, swap out the database.

Most dependencies don’t need inverting, because most dependencies aren’t options, they are just the way we are going to do it this time. So my – by now entirely unsurprising – suggestion is to *write simple code*, by focusing on use rather than reuse.

## "If you don’t like them, I have others"

When I look at SOLID, I see a mix of things that were once good advice, patterns that apply in a context, and advice that is easy to misapply. I wouldn’t offer any of it as context-free advice to new programmers. So what would I do instead? I thought there might be a one-to-one correspondence for each of the SOLID principles and patterns, since there is nothing inherently bad or wrong with any of them, but as the saying goes, “If I were going to Dublin, I wouldn’t start from here.”

So, given what I have learned about software development over the last 30 years, are there any principles that I would offer instead? And could they form a pithy acronym? The answer is in yes, and I will outline them in the next article.


\* Tradução do post publicado em 16 de março de 2021 no blog do Dan North com o título ["CUPID - THE BACK STORY"](https://dannorth.net/2021/03/16/cupid-the-back-story/)
