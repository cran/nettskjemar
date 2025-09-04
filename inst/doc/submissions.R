## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "sub-")
nettskjemar:::mock_if_no_auth()


## -----------------------------------------------------------------------------
library(nettskjemar)

# Replace with your submission ID
submission_id <- 27685292

# Get the submission data
submission <- ns_get_submission(submission_id)

# Display the submission data
submission

