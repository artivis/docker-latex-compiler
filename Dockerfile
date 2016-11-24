FROM ubuntu:14.04

MAINTAINER Jeremie Deray <todo@aol.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update && apt-get install wget -y && rm -rf /var/lib/apt/lists/*

RUN mkdir latex; cd latex;

RUN wget "http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"

RUN tar -xvzf install-tl-unx.tar.gz

RUN sudo yes I | ./install-tl*/install-tl

RUN export PATH=/usr/local/texlive/2016/bin/x86_64-linux/:$PATH

# volume /data where generated files are stored
#WORKDIR /data
#VOLUME ["/data"]

#CMD ["bash"]

#ADD latexcat /usr/local/bin/latexcat
#RUN chmod a+x /usr/local/bin/latexcat

#ENTRYPOINT ["/usr/local/bin/latexcat"]

#exec docker run --name pdflatex --rm -i --user="$(id -u):$(id -g)" --net=none -v $PWD:/data devng/pdflatex pdflatex -interaction=nonstopmode -output-dir=/data "$@"
