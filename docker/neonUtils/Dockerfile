FROM r-base:latest
RUN apt-get update
RUN apt-get -y install r-base-dev
RUN apt-get -y install libssl-dev
RUN apt-get -y install curl
RUN apt-get -y install r-cran-httr


RUN R -e "install.packages(c('neonUtilities'),\
                           dependencies=TRUE, \
                           repos='http://cran.rstudio.com/')"
