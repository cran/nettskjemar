## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "forms-")
nettskjemar:::mock_if_no_auth()


## -----------------------------------------------------------------------------
library(nettskjemar)

ns_sitrep()

## -----------------------------------------------------------------------------
# Retrieve all forms
forms <- ns_get_forms()

head(forms)

## -----------------------------------------------------------------------------
# Retrieve raw form data
raw_forms <- ns_get_forms(asis = TRUE)

# Display the raw response
print(raw_forms)

