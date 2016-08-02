FROM ubuntu:16.04

MAINTAINER Etienne Thevenot (etienne.thevenot@cea.fr)

# Update, install software and clean on same line, for slimmer image.
RUN apt-get update && \
    apt-get install -y --no-install-recommends r-base git && \
    git clone -b docker https://github.com/workflow4metabolomics/biosigner /files2/biosigner && \
    mkdir -p /files/biosigner && \
    cp /files2/biosigner/biosigner_wrapper.R /files/biosigner/ && rm -rf /files2/biosigner && \
    apt-get purge -y git && \
    apt-get clean && apt-get autoremove -y && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*
    
# Install needed R packages
RUN echo 'options("repos"="http://cran.rstudio.com")' >> /etc/R/Rprofile.site
RUN R -e "install.packages('batch')" && \
    R -e "source('http://bioconductor.org/biocLite.R') ; biocLite('biosigner')" && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make executable and available in the path
RUN chmod u+x /files/biosigner/biosigner_wrapper.R && cp /files/biosigner/biosigner_wrapper.R /usr/local/bin/

# Define Entry point script
ENTRYPOINT ["/files/biosigner/biosigner_wrapper.R"]
