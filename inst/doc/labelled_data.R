## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "lab-")
nettskjemar:::mock_if_no_auth()


## -----------------------------------------------------------------------------
library(nettskjemar)

# Replace this with your form ID
formid <- 123823

data <- ns_get_data(formid)
data

## -----------------------------------------------------------------------------
cb <- ns_get_codebook(formid)
cb

## -----------------------------------------------------------------------------
lab_data <- data |>
  ns_add_labels(cb)

lab_data

## -----------------------------------------------------------------------------
str(data)
str(lab_data)

## -----------------------------------------------------------------------------
library(labelled)

## -----------------------------------------------------------------------------
# Variable labels
var_label(lab_data$freetext)

## -----------------------------------------------------------------------------
# Value labels for 'radio'
val_labels(lab_data$radio)

## -----------------------------------------------------------------------------
lab_data$freetex
# Update variable-level label for 'freetext'
var_label(lab_data$freetext) <- "Important freetext comment"

lab_data$radio
# Update value labels for 'radio'
val_labels(lab_data$radio) <- c(Unhappy = -1, Happy = 1)

# Check updated labels
var_label(lab_data$freetext)
val_labels(lab_data$radio)

