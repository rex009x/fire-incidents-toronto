#### Preamble ####
# Purpose: Simulates an analysis dataset about fire incident occurrences in Toronto.
# Author: Jimmy Luc
# Date: 1 April 2024
# Contact: jimmy.luc@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# set seed for simulation
set.seed(905)

# simulate estimated dollar loss and property use data
property_uses <- c("condo", "apartment", "single_detached", "warehouse") %>%
  rep(each = 5, length.out = 20)

estimated_dollar_loss <- rnorm(property_uses, 25000, 12500) %>%
  round() %>%
  pmax(0)

estimated_loss_property_use <-
  tibble(
    property_use = property_uses,
    estimated_dollar_loss = estimated_dollar_loss
  )

# simulate estimated dollar loss and area of origin data
areas_of_origin <- c("kitchen", "trash", "office", "porch") %>%
  rep(each = 5, length.out = 20)

estimated_dollar_loss <- rnorm(areas_of_origin, 25000, 12500) %>%
  round() %>%
  pmax(0)

estimated_loss_area_of_origin <-
  tibble(
    area_of_origin = areas_of_origin,
    estimated_dollar_loss = estimated_dollar_loss
  )


#### Test data ####
## test data types##
# methods used: https://stackoverflow.com/a/29591221
all(sapply(estimated_loss_property_use$property_use, is.character))
all(sapply(estimated_loss_property_use$estimated_dollar_loss, is.numeric))

all(sapply(estimated_loss_area_of_origin$area_of_origin, is.character))
all(sapply(estimated_loss_area_of_origin$estimated_dollar_loss, is.numeric))
