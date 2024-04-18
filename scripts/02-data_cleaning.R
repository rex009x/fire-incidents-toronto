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
library(arrow)

#### Clean data ####
# load in raw data
raw_fire_incidents_data <-
  read_csv(
    file=here("data/raw_data/raw_fire_incidents.csv")
  )

# clean the names and select column of interest, 29425 entries
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

# clean selected variables of interest (omit NA values), 15628 entries
cleaned_fire_incidents_data <- cleaned_fire_incidents_data %>%
  drop_na(area_of_origin,
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
          tfs_arrival_time)

# a function to group area_of_origin into broader categories
group_areas <- function(area) {
  if (grepl("Living|Sleeping|Dining|Cooking|Washroom|Sauna|Laundry|Closet", area)) {
    return("Living and Common Areas")
  } else if (grepl("Storage|Locker|Garage|Trash|Basement|Elevator|Chimney|Mechanical|Ducting|Utility|Awning|Porch|Crawl Space|Concealed|Attic|Open Area|Court|Parking|Fuel|Deck", area)) {
    return("Storage and Structural")
  } else if (grepl("Engine|Running Gear|Electrical|Fuel|Operator|Passenger|Trunk|Cargo|Vehicle", area)) {
    return("Vehicle Components")
  } else if (grepl("Manufacturing|Assembly|Laboratory|Operating Room|Performance|Backstage", area)) {
    return("Functional and Performance Areas")
  } else if (grepl("Office|Sales, Showroom|Records", area)) {
    return("Office and Sales")
  } else if (grepl("Entranceway|Hallway|Stairway|Court, Atrium|Other Means of Egress", area)) {
    return("Entrance and Exit")
  } else if (grepl("Exterior Wall|Roof|Concealed|Wall|Structural|Attic|Open Area|Court|Patio|Terrace", area)) {
    return("Outside Areas")
  } else if (grepl("Multiple|Residential/Business|Other - unclassified|Undetermined|Under Investigation", area)) {
    return("Other/Undetermined")
  } else {
    return("Other")
  }
}

cleaned_fire_incidents_data$area_of_origin <-
  sapply(cleaned_fire_incidents_data$area_of_origin, group_areas)

# a function to clean and shorten the smoke alarm type values
clean_smoke_alarm_names <- function(name) {
  name_map <- c(
    "8 - Not applicable - no smoke alarm or presence undetermined" = "No Alarm/Undetermined",
    "2 - Hardwired (standalone)" = "Hardwired",
    "1 - Battery operated" = "Battery Operated",
    "4 - Interconnected" = "Interconnected",
    "3 - Wireless" = "Wireless"
  )
  # Use the name map to clean the names
  cleaned_name <- name_map[name]
  # If the name is not found in the map, return the original name
  if (is.na(cleaned_name)) {
    return(name)
  } else {
    return(cleaned_name)
  }
}

cleaned_fire_incidents_data$smoke_alarm_at_fire_origin_alarm_type <-
  sapply(cleaned_fire_incidents_data$smoke_alarm_at_fire_origin_alarm_type, clean_smoke_alarm_names)

#### Save data ####
# write cleaned data as csv and parquet
write_csv(
  cleaned_fire_incidents_data,
  "data/analysis_data/cleaned_fire_incidents.csv"
)

write_parquet(
  cleaned_fire_incidents_data,
  "data/analysis_data/cleaned_fire_incidents.parquet"
)
