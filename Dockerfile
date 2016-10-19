FROM ubuntu:16.04

MAINTAINER Etienne Thevenot (etienne.thevenot@cea.fr)

# Add keys for latest R version, needed for biosigner, ubuntu's repo is too old.
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu xenial/" >> /etc/apt/sources.list && \
    gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
    gpg -a --export E084DAB9 | apt-key add -
# Update, install software and clean on same line, for slimmer image.
RUN apt-get update && \
    apt-get install -y --no-install-recommends r-base r-base-dev git && \
    git clone -b 2.2.6 https://github.com/workflow4metabolomics/biosigner /files2/biosigner && \
    mkdir -p /files/biosigner && \
    cp /files2/biosigner/biosigner_wrapper.R /files/biosigner/ && rm -rf /files2/biosigner && \
    echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site && \
    R -e "install.packages('batch')" && \
    R -e "source('http://bioconductor.org/biocLite.R') ; biocLite('biosigner')" && \
    apt-get purge -y git r-base-dev && \
    apt-get clean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make executable and available in the path
RUN chmod u+x /files/biosigner/biosigner_wrapper.R && cp /files/biosigner/biosigner_wrapper.R /usr/local/bin/

# Define Entry point script
ENTRYPOINT ["/files/biosigner/biosigner_wrapper.R"]
