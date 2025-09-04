## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "atch-")
nettskjemar:::mock_if_no_auth()

## -----------------------------------------------------------------------------
library(nettskjemar)
# Example: List attachments for a specific submission
submission_id <- 27685292
ns_list_submission_attachments(submission_id)

## -----------------------------------------------------------------------------
# Example: List attachments for an entire form
formid <- 123823
ns_list_form_attachments(formid)

