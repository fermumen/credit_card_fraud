# start from the rocker/r-ver:3.5.0 image
FROM rocker/r-ver:3.5.1

# install the linux libraries needed for plumber
RUN apt-get update -qq && apt-get install -y \
  libssl-dev \
  libcurl4-gnutls-dev

# install plumber and needed libraries
#RUN R -e "install.packages('plumber')"
#RUN R -e "install.packages('mlr')"
#RUN R -e "install.packages('stringr')"
#RUN R -e "install.packages('xgboost')"
RUN install2.r -e  plumber XML mlr stringr xgboost

# copy everything from the current directory into the container
COPY / /

# open port 80 to traffic
EXPOSE 80

# when the container starts, start the main.R script
ENTRYPOINT ["Rscript", "main.R"]