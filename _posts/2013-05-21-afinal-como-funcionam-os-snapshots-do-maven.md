---
layout: post
title: "Afinal, como funcionam os snapshots do Maven?"
description: ""
category: 
tags: [maven, cm]
---
{% include JB/setup %}

## O contexto

O Maven utiliza o indicador de versão de&nbsp;[SNAPSHOT](http://books.sonatype.com/mvnref-book/reference/pom-relationships-sect-pom-syntax.html#pom-reationships-sect-versions) quando o projeto em questão está em fase de desenvolvimento ativo.

É comum que utilizemos versões SNAPSHOT em projetos relacionados, como na declaração abaixo:
{% highlight xml%}
(...)
<dependency>
    <groupId>br.com.getnet.portais.commons.mango-cadastro</groupId>
    <artifactId>mango-cadastro</artifactId>
    <version>1.0-SNAPSHOT</version>
</dependency>
(...)
{% endhighlight %}

Utilizar SNAPSHOT na versão indica que o Maven deve identificar novas versões da biblioteca, na fase de&nbsp;[resolução das dependências](http://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html) quando o projeto é recompilado. É um comportamento diferente de uma versão comum (1.0 por exemplo), que apenas é verificada (e baixada) novamente se um&nbsp;[plugin](http://mojo.codehaus.org/versions-maven-plugin/) do Maven for utilizado ou a dependência for removida do&nbsp;[repositório local](http://maven.apache.org/guides/mini/guide-configuring-maven.html).

## O problema

Utilizar snapshots é uma boa prática no desenvolvimento, entretanto em muitos momentos quando estamos iniciando no uso do Maven, temos dificuldade em utilizar este mecanismo do versionamento, e nem sempre as versões são atualizadas quando necessitamos.


Considere os dois excertos de POM abaixo:

* Uma API específica:
{% highlight xml%}
<project>
	<groupId>br.com.getnet</groupId>
	<artifactId>dependencia</artifactId>
	<version>1.0-SNAPSHOT</version>
</project>
{% endhighlight %}

* Um projeto que a utiliza:
{% highlight xml%}
<project>
	<groupId>br.com.getnet</groupId>
	<artifactId>projeto</artifactId>
	<version>1.0-SNAPSHOT</version>
    <dependencies>
        <dependency>
			<groupId>br.com.getnet</groupId>
			<artifactId>dependencia</artifactId>
			<version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
</project>
{% endhighlight %}

 
Para estes dois excertos, 2 desenvolvedores realizaram as seguintes iterações:

1. Desenvolvedor A cria *dependencia-1.0-SNAPSHOT.jar*
1. Desenvolvedor B cria *projeto-1.0-SNAPSHOT*, que utiliza a *dependencia-1.0-SNAPSHOT.jar*.
1. Desenvolvedor A realiza suas primeiras alterações e commita o *dependencia-1.0-SNAPSHOT.jar*
1. Desenvolvedor A também executa o deploy do seu jar num&nbsp;[repositório externo](http://maven.apache.org/guides/introduction/introduction-to-repositories.html) (como o&nbsp;[Artifactory](http://www.jfrog.com/home/v_artifactory_opensource_overview))
1. Desenvolvedor B executa o&nbsp;[build](http://books.sonatype.com/mvnref-book/reference/lifecycle-sect-structure.html) de sua aplicação e utiliza a versão SNAPSHOT atual da *dependencia-1.0-SNAPSHOT.jar*.
1. Desenvolvedor A encontra bugs na *dependencia-1.0-SNAPSHOT.jar*. Corrige, commita e faz o deploy do novo artefato no repositório externo. Em tese o artefato corrigido deve substituir o artefato antigo, quando um projeto que o utilize execute o build.
1. Desenvolvedor B é avisado pelo desenvolvedor A que a *dependencia-1.0-SNAPSHOT.jar* tem uma nova versão com bugs corrigidos, e decide fazer o build para receber as correções. **Entretanto, este processo não funciona, a dependência não é atualizada em seu repositório local e ele continua utilizando o JAR antigo, com as falhas**.

Outras situações peculiares costumam ocorrer:
* às vezes as dependencias são atualizadas, às vezes não, sem um motivo aparente;
* para algumas pessoas a dependência é atualizada, para outras não, no mesmo momento;
* nenhum dos dois consegue reproduzir o problema no dia seguinte, não entendendo o que aconteceu...

## Porquê isto acontece?

Embora o Maven sempre busque a última versão de uma dependência SNAPSHOT, há uma&nbsp;[configuração](http://maven.apache.org/ref/3.0.5/maven-settings/settings.html) do mesmo que define a&nbsp;[política de update de dependências](http://docs.codehaus.org/display/MAVEN/Repository+-+SNAPSHOT+Handling), tanto das versões released quanto das versões SNAPSHOT. **Na configuração padrão do Maven para esta política, apenas uma vez ao dia uma nova versão de um SNAPSHOT específico é atualizada, ignorando versões novas geradas no decorrer deste dia**.

## Possíveis soluções

Dentre as possíveis soluções, destaco:
1. Utilizar a opção **-U** ou **--update-snapshots** na execução do Maven, para forçar o update das dependências SNAPSHOT, independentemente do último update executado.
1. Eliminar os snapshots locais, sempre realizando o update dos mesmos, através da opção **--clean-snapshots**
1. Configurar o Maven instalado em sua máquina para que a política de atualização de snapshots ocorra em intervalos menores. Para maiores detalhes consulte a&nbsp;[documentação relacionada](http://maven.apache.org/settings.html), especialmente com relação a configuração de&nbsp;[mirrors](http://maven.apache.org/guides/mini/guide-mirror-settings.html)

## Dicas

* Para uso do Maven no Netbeans, consulte a&nbsp;[documentação da IDE](https://platform.netbeans.org/tutorials/nbm-maven-quickstart.html).
* Para uso do Maven no Eclipse, consulte a&nbsp;[documentação do plugin m2e](http://wiki.eclipse.org/Maven_Integration).
