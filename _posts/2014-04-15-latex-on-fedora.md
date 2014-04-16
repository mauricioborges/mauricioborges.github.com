---
layout: post
title: "Installing TeX Live on Fedora 19"
description: ""
category: 
draft: false
tags: ['howto','fedora','latex','texlive']
---
{% include JB/setup %}

# HOWTO:

* remove all texlive packages:
{% highlight bash %}
sudo yum remove texlive*
{% endhighlight %}
* if you don't have Perl 5.6.0+, you can have some Pod::Usage problems. In this case: 
{% highlight bash %}
sudo um provides */Pod/Usage.pm
sudo yum install perl-Pod-Usage
{% endhighlight %}
* run the installer:
{% highlight bash %}
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz 
tar -xvf  install-tl-unx.tar.gz
cd install-tl*
sudo ./install-tl
{% endhighlight %}
* Put on the path (~/.bashrc) the line below, and it's all cool:
{% highlight bash %}
echo PATH=/usr/local/texlive/2013/bin/i386-linux:\$PATH >> ~/.bashrc
{% endhighlight %}


# Links:

* http://www.linuxquestions.org/questions/linux-newbie-8/texlive-dvd-installation-failure-fedora-4175480036/
* http://www.tug.org/texlive/quickinstall.html
* http://stackoverflow.com/questions/11064270/perlbrew-error-cant-locate-pod-usage-pm
