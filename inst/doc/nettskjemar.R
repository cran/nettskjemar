## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "ns-")
nettskjemar:::mock_if_no_auth()

## -----------------------------------------------------------------------------
library(nettskjemar)
formid <- 123823

data <- ns_get_data(formid)
data

## -----------------------------------------------------------------------------
# Fetch raw data
ns_get_data(formid, type = "long")

## -----------------------------------------------------------------------------
ns_get_data(formid) |>
  ns_alter_checkbox(
    to = "list"
  )

## -----------------------------------------------------------------------------
library(tidyr)
library(dplyr)

# As list column
ns_get_data(formid) |>
  ns_alter_checkbox(
    to = "list"
  ) |>
  relocate(checkbox_matrix.1, .after = 2)


# Turns list column, into rows
ns_get_data(formid) |>
  ns_alter_checkbox(
    to = "list"
  ) |>
  unnest(checkbox_matrix.1) |>
  relocate(checkbox_matrix.1, .after = 2)

## -----------------------------------------------------------------------------
# As delimited string column
ns_get_data(formid) |>
  ns_alter_checkbox(
    to = "character",
    sep = ";"
  ) |>
  relocate(checkbox_matrix.1, .after = 2)

# Turns string column, into rows
ns_get_data(formid) |>
  ns_alter_checkbox(
    to = "character",
    sep = ";"
  ) |>
  relocate(checkbox_matrix.1, .after = 2) |>
  separate_rows(checkbox_matrix.1)

