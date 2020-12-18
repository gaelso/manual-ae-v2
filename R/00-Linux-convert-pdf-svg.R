
## This script is to convert pdf vector images to svg, a better vector format for R

## Install Linux dependencies
## -- apt-get install libcairo2-dev libspectre-dev librsvg2-dev libpoppler-glib-dev

## Install grConvert
devtools::install_github("sjp/grConvert", force = TRUE)

library(grConvert)
grConvert.capabilities()

## Convert images
dir.create("source/figures/svg", showWarnings = FALSE)

convertPicture(paste0(fig_path, "/comparts.pdf"), paste0(fig_path, "/svg/comparts.pdf.svg"))
convertPicture(paste0(fig_path, "/emonde1.pdf"), paste0(fig_path, "/svg/emonde1.pdf.svg"))
convertPicture(paste0(fig_path, "/vanuatu.pdf"), paste0(fig_path, "/svg/vanuatu.pdf.svg"))
