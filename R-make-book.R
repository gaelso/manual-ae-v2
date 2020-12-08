## Thailand emission factor update 2020
## March 2020
## Gael Sola, FAO

## ++++++
## This script sources R scripts and makes the report with bookdown::render_book()
## ++++++

## Source R scripts
source("R/00-libs.R")

source("R/01-photo-edit.R")

source("R/02-text-replace.R")

## Make report

## DOCX
# bookdown::render_book(
#   input = "index.Rmd",
#   output_format = "bookdown::word_document2",
#   output_file = paste0("Manual-AE-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"), ".docx"),
#   output_dir = "Manual-AE",
#   output_options = list(reference_docx = "ref-empty.docx")
# )

## PDF -- For pdf install webshot and webshot::install_phantomjs() 
bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::pdf_book",
  output_file = paste0("Manual-AE-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"), ".pdf"),
  output_dir = "Manual-AE"
  )

## HTML - GITBOOK
bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::gitbook",
  output_dir = paste0("Manual-AE/Manual-AE-gitbook-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
)

## Clean temp files
## !!!!!!!!!!!!!!!!!!!!!  TBD !!!!!!!!!!!!!!!!!!!!
file.remove(list.files(pattern = "Manual-AE-"))


