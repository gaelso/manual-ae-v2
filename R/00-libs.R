
## List required libraries
libs <- c(
  "rmarkdown", "bookdown", "tinytex", "tidyverse", "magick", "DiagrammeR",
  "tikzDevice", "grImport", "gridExtra", "DiagrammeRsvg", "rsvg", "extrafont", 
  "htmltools"
)

## Not use: "grImport2", "grConvert"

## Install the dev version of tikzDevice
if ("tikzDevice" %in% libs & !("tikzDevice" %in% installed.packages())) 
  devtools::install_github("yihui/tikzDevice")

## Install other missing libraries
libs_install <- libs[!(libs %in% installed.packages())]
libs_install

lapply(libs_install, install.packages)

rm(libs_install)

## Load libraries
lapply(libs, require, character.only = TRUE)

## Load Windows fonts and add Computer modern if missing
windowsFonts()

if (!("CMU Serif"  %in% names(windowsFonts()))) {
  download.file(
    url = "https://www.fontsquirrel.com/fonts/download/computer-modern", 
    destfile = paste0(fig_path, "/computer-modern.zip"), 
    mode = "wb"
    )
  unzip(zipfile = paste0(fig_path, "/computer-modern.zip"), exdir = paste0(fig_path, "/computer-modern"))
  extrafont::font_import(paths = fig_path, recursive = T, pattern = "cmu*", prompt = FALSE)
  extrafont::loadfonts(device = "win")
}


## Add amssymb to tikzDevice for Diameter symbol (\varnothing)
options(
  tikzLatexPackages = c(getOption( "tikzLatexPackages" ),"\\usepackage{amsmath,amssymb}")
  )
