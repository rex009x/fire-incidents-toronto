#### Preamble ####
# Purpose: Tests the cleaned data types and values
# Author: Jimmy Luc
# Date: 1 April 2024
# Contact: jimmy.luc@mail.utoronto.ca
# License: MIT
# Pre-requisites: Execute the 01-download_data.R and 02-data_cleaning.R scripts before running this file


#### Workspace setup ####
library(tidyverse)
library(here)
library(arrow)

cleaned_fire_incidents_data <-
  read_parquet(
    file=here("data/analysis_data/cleaned_fire_incidents.parquet")
  )

#### Test data ####
## test data types##
# methods used: https://stackoverflow.com/a/29591221
all(sapply(cleaned_fire_incidents_data$area_of_origin, is.character))
all(sapply(cleaned_fire_incidents_data$estimated_dollar_loss, is.numeric))

all(sapply(cleaned_fire_incidents_data$latitude, is.numeric))
all(sapply(cleaned_fire_incidents_data$longitude, is.numeric))

all(sapply(cleaned_fire_incidents_data$method_of_fire_control, is.character))
all(sapply(cleaned_fire_incidents_data$number_of_responding_personnel, is.numeric))
all(sapply(cleaned_fire_incidents_data$possible_cause, is.character))
all(sapply(cleaned_fire_incidents_data$property_use, is.character))

all(sapply(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin, is.character))
all(sapply(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin_alarm_failure, is.character))
all(sapply(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin_alarm_type, is.character))

all(sapply(cleaned_fire_incidents_data$tfs_alarm_time, is.double))
all(sapply(cleaned_fire_incidents_data$tfs_arrival_time, is.double))

## test data values ##
all(cleaned_fire_incidents_data$area_of_origin != '')
all(cleaned_fire_incidents_data$estimated_dollar_loss >= 0) # cannot have negative loss

all(cleaned_fire_incidents_data$latitude >= -90 & cleaned_fire_incidents_data$latitude <= 90)
all(cleaned_fire_incidents_data$longitude >= -180 & cleaned_fire_incidents_data$longitude <= 180)

all(cleaned_fire_incidents_data$method_of_fire_control != '')
all(cleaned_fire_incidents_data$number_of_responding_personnel >= 0)
all(cleaned_fire_incidents_data$possible_cause != '')
all(cleaned_fire_incidents_data$property_use != '')

all(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin != '')
all(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin_alarm_failure != '')
all(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin_alarm_type != '')

min(cleaned_fire_incidents_data$tfs_alarm_time) > as.POSIXct("2010/12/31")
max(cleaned_fire_incidents_data$tfs_alarm_time) < as.POSIXct("2023/01/01")


min(cleaned_fire_incidents_data$tfs_arrival_time) > as.POSIXct("2010/12/31")
max(cleaned_fire_incidents_data$tfs_arrival_time) < as.POSIXct("2023/01/01")

