FROM container-registry.phenomenal-h2020.eu/phnmnl/rbase

MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

ENV TOOL_NAME=biosigner
ENV TOOL_VERSION=2.2.7
ENV CONTAINER_VERSION=1.4
ENV CONTAINER_GITHUB=https://github.com/phnmnl/container-biosigner

LABEL version="${CONTAINER_VERSION}"
LABEL software.version="${TOOL_VERSION}"
LABEL software="${TOOL_NAME}"
LABEL base.image="container-registry.phenomenal-h2020.eu/phnmnl/rbase"
LABEL description="Discovery of significant signatures from omics data."
LABEL website="${CONTAINER_GITHUB}"
LABEL documentation="${CONTAINER_GITHUB}"
LABEL license="${CONTAINER_GITHUB}"
LABEL tags="Metabolomics"

LABEL version="${CONTAINER_VERSION}"
LABEL tool_version="${TOOL_VERSION}"

# Update, install dependencies, clone repos and clean
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends g++ gfortran git make && \
    echo "Cloning biosigner repository" && \
    git clone --depth 1 --single-branch --branch v${TOOL_VERSION} https://github.com/workflow4metabolomics/biosigner /files/biosigner && \
    echo "Installing R packages" && \
    R -e "install.packages(c('batch', 'randomForest'), lib='/usr/lib/R/library', dependencies = TRUE, repos='https://cran.rstudio.com')" && \
    R -e "source('http://bioconductor.org/biocLite.R') ; biocLite('biosigner')" && \
    echo "Cleaning..." && \
    apt-get purge -y g++ gfortran git make && \
    apt-get autoremove --purge -y && \
    apt-get clean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*

# Make tool accessible through PATH
ENV PATH=$PATH:/files/biosigner

# Make test script accessible through PATH
ENV PATH=$PATH:/files/biosigner/test

# Define Entry point script
ENTRYPOINT ["/files/biosigner/biosigner_wrapper.R"]
