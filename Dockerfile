FROM ubuntu:16.04

MAINTAINER Etienne Thevenot (etienne.thevenot@cea.fr)

ENV TOOL_VERSION=2.2.7
ENV CONTAINER_VERSION=1.3

LABEL version="${CONTAINER_VERSION}"
LABEL tool_version="${TOOL_VERSION}"

# Add keys for latest R version, needed for biosigner, ubuntu's repo is too old.
RUN echo "deb http://cran.univ-paris1.fr/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9

RUN \
     apt-get update \
  && apt-get install -y --no-install-recommends \
            g++ \
            gfortran \
            git \
            make \
            r-base \
   && echo "Cloning biosigner repository" \
   && git clone --depth 1 --single-branch --branch v${TOOL_VERSION} https://github.com/workflow4metabolomics/biosigner /files/biosigner \
   && echo "Installing R packages" \
   && R -e "install.packages(c('batch', 'randomForest'), lib='/usr/lib/R/library', dependencies = TRUE, repos='https://cran.rstudio.com')" \
   && R -e "source('http://bioconductor.org/biocLite.R') ; biocLite('biosigner')" \
   && echo "Cleaning..." \
   && apt-get purge -y g++ gfortran git make \
   && apt-get autoremove --purge -y \
   && apt-get clean \
   && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make tool accessible through PATH
ENV PATH=$PATH:/files/biosigner

# Make test script accessible through PATH
ENV PATH=$PATH:/files/biosigner/test

# Define Entry point script
ENTRYPOINT ["/files/biosigner/biosigner_wrapper.R"]
