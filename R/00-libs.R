
## List required libraries
libs <- c(
  "rmarkdown", "bookdown", "tinytex", "tidyverse", "magick", "DiagrammeR",
  "tikzDevice", "grImport"
)

## Install missing libraries
libs_install <- libs[!(libs %in% installed.packages())]
libs_install

lapply(libs_install, install.packages)

rm(libs_install)

## Load libraries
lapply(libs, require, character.only = TRUE)
