## Thailand emission factor update 2020
## March 2020
## Gael Sola, FAO

## ++++++
## This script sources R scripts and makes the report with bookdown::render_book()
## ++++++

## Figures settings
img_hires <- list(height = 2500, width = 4000, density = "300x300")
img_lowres <- list(height = 600, width = 1200, density = "72x72")

img_res <- "low" ## Choose "hi" for high resolution !!! hires not supported yet !!!

img_size <- if (img_res == "low") img_lowres else img_hires
img_path <- ifelse(img_res == "low", "source/photo_lowres", "source/photo_hires")

fig_path <- "source/figures"

with_color <- TRUE ## FALSE for black and white, not fully supported yet

## Source R scripts
source("R/00-libs.R")

source("R/00-functions.R")

#source("R/00-convert-pdf-svg-LINUX.R") ## Need tools from Linux, done with Rstudio server on WSL

#source("R/00-convert-pdf-png.R")

source("R/prepa-photos.R")

source("R/prepa-figs.R")

source("R/prepa-tabs.R")

source("R/red_line_code.R")

#source("R/conv_tex_rmd.R") ## Run one time


## Make report


## PDF -- For pdf install webshot and webshot::install_phantomjs() 
# bookdown::render_book(
#   input = "index.Rmd",
#   output_format = "bookdown::pdf_book",
#   output_file = paste0("Manual-AE-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"), ".pdf"),
#   output_dir = "Manual-AE"
#   ) ## >> NOT WORKING WITH THEOREM AND PROOF HACK

bookdown::preview_chapter(
  input = c("index.Rmd", "01-1-base-biology.Rmd"),
  output_format = "bookdown::pdf_book",
  output_dir = paste0("Manual-AE/Manual-AE-pdf-sections-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
)

bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::pdf_book",
  output_dir = paste0("Manual-AE/Manual-AE-pdf-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
  )

## HTML - GITBOOK
bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::gitbook",
  output_dir = paste0("Manual-AE/Manual-AE-gitbook-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
)

## HTML - html_doc
bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::html_document2",
  output_dir = paste0("Manual-AE/Manual-AE-html-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
)

## HTML - html_book
bookdown::render_book(
  input = "index.Rmd",
  output_format = "bookdown::html_book",
  output_dir = paste0("Manual-AE/Manual-AE-html_book-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"))
)

## Clean temp files
file.remove(list.files(pattern = "Manual-AE-"))
unlink(x = "_bookdown_files", recursive = T)

## DOCX -- Needs to restart R as gridExtra messes up with kables in DOCX
# bookdown::render_book(
#   input = "index.Rmd",
#   output_format = "bookdown::word_document2",
#   output_file = paste0("Manual-AE-", format(Sys.time(), format = "%Y-%m-%d-%H%M%S"), ".docx"),
#   output_dir = "Manual-AE",
#   output_options = list(reference_docx = "ref-empty.docx")
# )

