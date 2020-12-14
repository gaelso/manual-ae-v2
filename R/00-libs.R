
## List required libraries
libs <- c(
  "rmarkdown", "bookdown", "tinytex", "tidyverse", "magick", "DiagrammeR",
  "tikzDevice", "grImport", "gridExtra"
)

## Not use: "grImport2", "grConvert", "extrafont"

## Install the dev version of tikzDevice
if ("tikzDevice" %in% libs & !("tikzDevice" %in% installed.packages())) devtools::install_github("yihui/tikzDevice")

## Install other missing libraries
libs_install <- libs[!(libs %in% installed.packages())]
libs_install

lapply(libs_install, install.packages)

rm(libs_install)

## Load libraries
lapply(libs, require, character.only = TRUE)

## Load fonts --- NOT WORKING
# loadfonts(device = "win")
# windowsFonts()

# options(
#   tikzDefaultEngine = "xetex",
#   tikzXelatexPackages = "\\usepackage{amsmath,amssymb}",
#   tikzMetricPackages = c( "\\usepackage[utf8]{inputenc}", "\\usepackage[T1]{fontenc}", "\\usetikzlibrary{calc}", "\\usepackage{amsmath,amssymb}"),
#   tikzUnicodeMetricPackages = c(
#     "\\usepackage[utf8]{inputenc}", 
#     "\\usepackage[T1]{fontenc}", 
#     "\\usetikzlibrary{calc}", 
#     "\\usepackage{amsmath,amssymb}", 
#     "\\usepackage{fontspec}",
#     "\\usepackage{xunicode}" 
#     )
#   )
