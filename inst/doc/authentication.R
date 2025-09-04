## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "auth-")
nettskjemar:::mock_if_no_auth()


## -----------------------------------------------------------------------------
library(nettskjemar)

ns_sitrep()

