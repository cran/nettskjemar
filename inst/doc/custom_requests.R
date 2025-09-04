## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  error = FALSE,
  fig.path = "static"
)
options(max.print = 50)

vcr::setup_knitr(prefix = "cr-")
nettskjemar:::mock_if_no_auth()


## -----------------------------------------------------------------------------
library(nettskjemar)
ns_req()

## -----------------------------------------------------------------------------
library(httr2)
formid <- 123823

ns_req() |>
  req_url_path_append("form", formid, "settings")

## -----------------------------------------------------------------------------
response <- ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_perform()

response

## -----------------------------------------------------------------------------
settings_data <- resp_body_json(response)
settings_data

## -----------------------------------------------------------------------------
settings_data$postponable

## -----------------------------------------------------------------------------
ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_method("PATCH")

## -----------------------------------------------------------------------------
ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_method("PATCH") |>
  req_body_json(
    list(
      postponable = TRUE
    )
  )

## -----------------------------------------------------------------------------
try({
ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_method("PATCH") |>
  req_body_json(
    list(
      postponable = TRUE
    )
  ) |>
  req_perform()
})

## -----------------------------------------------------------------------------
# last_response() |>
#   resp_body_json()

## -----------------------------------------------------------------------------
# Show old settings
settings_data$personalDataPurposeDescription
settings_data$shouldHideProgressBar

# Set new settings
ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_method("PATCH") |>
  req_body_json(
    list(
      personalDataPurposeDescription = "Testing the API",
      shouldHideProgressBar = TRUE
    )
  ) |>
  req_perform()

## -----------------------------------------------------------------------------
settings_new <- ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_perform() |>
  resp_body_json()

settings_new$personalDataPurposeDescription
settings_new$shouldHideProgressBar


## -----------------------------------------------------------------------------
# Set new settings
ns_req() |>
  req_url_path_append("form", formid, "settings") |>
  req_method("PATCH") |>
  req_body_json(
    list(
      personalDataPurposeDescription = "Form for testing the API",
      shouldHideProgressBar = FALSE
    )
  ) |>
  req_perform()

