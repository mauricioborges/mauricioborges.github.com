---
layout: post
title: "Iniciando no Latex"
description: ""
category: 
draft: true
tags: [writing, latex, tex]
---
{% include JB/setup %}

Tópicos:
* Instalando o LaTeX
* Executando o LaTeX
* Integração com o Apache Maven

{% highlight latex %}
\documentclass{book}
\begin{document}

%=======================================================================
% EXEMPLOS DE USO - INICIO
%=======================================================================
\part{Introdução ao LaTeX}
Esta é definição de uma parte. Em livros isto é muito comum, quando é 
desejável que o conteúdo da parte em questão possa ser lido em separado 
ou quando há assuntos diferentes dentro de um mesmo domínio.

\chapter{Para começar com LaTeX}
\begin{itemize}
\item Baixe o MiKTeX (http://miktex.org/) caso você use Windows, ou instale
os pacotes do seu SO Unix. No windows eu prefiro o MiKTeX Portable;
\item escreva seu documento LaTeX, com extensão .tex (não é obrigatória,
mas não curto passar trabalho)
\item execute pdflatex nomedoseuarquivocomousemextensaotantofazvodkaouaguadecoco
\item vá para o google depois de ler esse texto: Algumas sugestões de site:
(https://github.com/rbavila/tugunisinos/blob/master/exemplo-monografia.tex, http://en.wikibooks.org/wiki/LaTeX, http://latex-project.org/intro.html)
\end{itemize}

\chapter{Escrevendo um texto}
A idéia do LaTeX é escrever textos livremente, ou seja, preocupar-se mais
com o conteúdo do que com a forma, deixando que a ferramenta realize a
formatação e diagramação. Obviamente o objetivo dele não é dar liberdade
e agilidade na diagramação, design e apresentação do documento, mas sim 
facilitar a escrita sem necessidade de preocupação com a formatação.

Muitas das formatações automáticas foram definidas dentro da classe, que está
no início do documento atual (no comando documentclass) ou no documento raiz
(quando utilizando o pacote subfiles).
Não importa quantos espaços você                        pressionar, 
quem define o espaçamento entre palavras é o LaTeX.
Uma quebra de linha não faz diferença.
Duas ou mais quebras.

Correspondem  a um novo parágrafo.

Entendeu?

Olha o código fonte...

Mas se você \sout{gosta de estragar a formatação bonita dele ou escrever 
poesia com métrica} precisa incluir quebras de linha, pode usar\\duas barras 
invertidas e\\ele\\quebra a linha. Eu não vou descobrir como inserir espaços
adicionais porque \sout{isto me parece uma gambiarra sem tamanho} não acho 
que isso seja necessário no momento.

Você pode criar listas de itens como eu fiz lá em cima, ou listas 
enumeradas:
\begin{enumerate}
\item um
\item dois
\item três
\item quatro
\item prá ficar maneiro eu jogo o clima lá no alto
\end{enumerate}

É possível enfatizar o texto \emph{assim} dentro de um bloco ou ainda 
colocar em \textbf{negrito deste jeito}. 

O emph pode ser alterado pela configuração do documento
para, por exemplo, mudar a fonte e o tamanho
ao enfatizar algo

\textit{Já em itálico, é um pouco diferente.}

É possível criar tabelas assim:

\begin{longtable}{| l | l | l | l | l |}
\caption{Exemplo de tabela em \LaTeX}\\
\hline
&  & \multicolumn{2}{c}{Colunas Mescladas} & \  \\ \hline
\emph{Coluna 1} & \emph{Coluna 1} & \emph{Coluna 1} & \emph{Coluna 1} & \emph{Coluna 1}\\ \hline
22 & 206ms & 3/ 100 = 3\% & 0/ 100 = 0\% & corv-car1-gw.nero.net [207.98.64.177]\\ \hline
21 & 206ms & 3/ 100 = 3\% & 0/ 100 = 0\% & corv-car1-gw.nero.net [207.98.64.177]\\ \hline
23 & 208ms & 4/ 100 = 4\% & 0/ 100 = 0\% & eris.apache.org [140.211.11.4]\\ \hline
\end{longtable}

Os textos são automaticamente justificados. Mas tudo é possível...\\
\begin{flushleft}
Alinhar a esquerda, por exemplo, sem justificar, aí lá no cantão quando a frase acabaar ele não vai ajustar o espaçamento entre palavras para que o layout fique ajustado...isso aí mesmo que você está vendo
\end{flushleft}
\begin{flushright}
Ou ainda a linhar a direita para confundir o leitor\\
\end{flushright}
E mais...\\
\begin{centering}
Ou alinhar ao centro\\para poder escrever\\suas poesias com métricas\\
\end{centering}

Ainda é possível inserir imagens (em EPS, JPG, PNG ou PDF, na configuração que usei):
\begin{figure}
	\caption{Procurei na internet: vida de programador...}
	\label{fig:vidadeprogramador}
	\centering%
	\begin{minipage}{.8\textwidth}
		\includegraphics[width=\textwidth]{vidadeprogramador}
	\end{minipage}
\end{figure}
\chapter{O que é o mundo bizarro?}
Um capítulo começa sempre em uma página nova (embora isso tenha sido 
configurado na classe.
\section{De onde surgiu a idéia?}
Uma seção começa logo abaixo do texto do capítulo, é uma divisão do mesmo
\section{Quem criou?}
Pode-se criar muitas seções uma depois da outra..
\subsection{Batman}
\subsection{Oscar Niemeyer}
\subsection{Darth Vader}
\subsection{Especial: ídolos do Roque}
Esta subseção possui seções ainda mais internas. Se vocÊ precisar de mais 
subseções pode ser que o texto está muito segmentado e subdividido. Talvez 
rever seu texto seria mais apropriado.
\subsubsection{Freddy Mercury}
Sou uma subseção lírica.
\subsubsection{Hendrix aos 28}
Eu sou uma subseção legal, que até recebi o Roque aqui na minha casa esses tempos.
\subsubsection{Sílvio Santos}
Ma oe.
%=======================================================================
% EXEMPLOS DE USO - FIM
%=======================================================================

{% endhighlight %}
