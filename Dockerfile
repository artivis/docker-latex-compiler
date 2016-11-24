FROM ubuntu:14.04

MAINTAINER Jeremie Deray <todo@aol.com>

ENV TERM xterm

# Add universe repo
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

# Update repo & install wget
RUN apt-get update && apt-get install wget make -y && rm -rf /var/lib/apt/lists/*

# Download the latest texlive version
RUN wget "http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"

# Extract
RUN tar -xvzf install-tl-unx.tar.gz && rm install-tl-unx.tar.gz

# Install texlive
RUN sudo yes I | ./install-tl*/install-tl

# Remove install files
RUN rm -rf install-tl-20*

# Export texlive path
ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux/:${PATH}"

# volume /data where generated files are stored
#WORKDIR /data
#VOLUME ["/data"]

#CMD ["bash"]

#ADD latexcat /usr/local/bin/latexcat
#RUN chmod a+x /usr/local/bin/latexcat

#ENTRYPOINT ["/usr/local/bin/latexcat"]

#exec docker run --name pdflatex --rm -i --user="$(id -u):$(id -g)" \
# --net=none -v $PWD:/data devng/pdflatex pdflatex -interaction=nonstopmode -output-dir=/data "$@"
