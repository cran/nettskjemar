## -----------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = TRUE,
  error = FALSE,
  fig.path = "static"
)

vcr::setup_knitr(prefix = "meta-")
nettskjemar:::mock_if_no_auth()


## -----------------------------------------------------------------------------
library(nettskjemar)

# Replace this with your form ID
formid <- 123823

# Retrieve metadata for the form
form_meta <- ns_get_meta(formid)

# Display the metadata
form_meta

## -----------------------------------------------------------------------------
# Access the title of the form
form_meta$title

# Check the number of submissions
num_submissions <- form_meta$numberOfSubmissions
print(paste("Number of submissions:", num_submissions))

# Check if the form is open
is_open <- form_meta$isOpen
print(paste("Is the form open?:", is_open))

## -----------------------------------------------------------------------------
# Replace with your desired file path
output_path <- "meta_110000.json"

# Save the metadata to the specified path
ns_write_meta(form_meta, output_path)

## -----------------------------------------------------------------------------
# Save to a file without .json extension
ns_write_meta(form_meta, "meta_file")

# The file will be saved as "meta_file.json"

## -----------------------------------------------------------------------------
# Save the metadata in a pretty-printed JSON file
ns_write_meta(
  form_meta,
  "pretty_meta.json",
  pretty = TRUE
)

## -----------------------------------------------------------------------------
file.remove(c(
  "meta_110000.json",
  "meta_file.json",
  "pretty_meta.json"
))

