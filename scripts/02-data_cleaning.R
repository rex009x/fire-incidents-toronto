#### Preamble ####
# Purpose: Cleans the raw fire incidents data
# Author: Jimmy Luc
# Date: 1 April 2024
# Contact: jimmy.luc@mail.utoronto.ca
# License: MIT
# Pre-requisites: Execute the 01-download_data.R script before running this file

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(here)

#### Clean data ####
# load in raw data
raw_fire_incidents_data <-
  read_csv(
    file=here("data/raw_data/raw_fire_incidents.csv")
  )

# clean the names and select column of interest
cleaned_fire_incidents_data <-
  clean_names(raw_fire_incidents_data) |>
  select(
    area_of_origin,
    estimated_dollar_loss,
    latitude,
    longitude,
    method_of_fire_control,
    number_of_responding_personnel,
    possible_cause,
    property_use,
    smoke_alarm_at_fire_origin,
    smoke_alarm_at_fire_origin_alarm_failure,
    smoke_alarm_at_fire_origin_alarm_type,
    tfs_alarm_time,
    tfs_arrival_time
  )

# TODO clean selected variables of interest (omit NA values)

#### Save data ####
# write cleaned data as csv
write_csv(
  cleaned_fire_incidents_data,
  "data/analysis_data/cleaned_fire_incidents.csv"
)
