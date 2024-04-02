#### Preamble ####
# Purpose: Models the Estimated Dollars Loss
# Author: Jimmy Luc
# Date: 1 April 2024
# Contact: jimmy.luc@mail.utoronto.ca
# License: MIT
# Pre-requisites: Execute the 01-download_data.R and 02-data_cleaning.R scripts before running this file


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_fire_incidents.csv")

### Model data ####
# TODO complete the modeling for capture the estimated dollars loss


#### Save model ####
# TODO save the model to "/models" as .rds