#### Preamble ####
# Purpose: Downloads and saves the data from the opendatatoronto R package
# Author: Jimmy Luc
# Date: 1 April 2024
# Contact: jimmy.luc@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

#### Download data ####
# retrieve package id
dataset <-
  search_packages("Fire Incidents")

# retrieve resource id
dataset <-
  list_package_resources(dataset$id) |> first()

# retrieve dataset
raw_fire_incidents_data <- get_resource(dataset$id)


#### Save data ####
# write raw data as csv
write_csv(
  raw_fire_incidents_data,
  "data/raw_data/raw_fire_incidents.csv"
)
