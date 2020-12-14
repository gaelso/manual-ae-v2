

###
### Figures chapter 2 ----------------------------------------------------------

###
### plan
###

arbre   <- magick::image_read(paste0(fig_path, "/arbre.png")) 

arbre   <- magick::image_read(paste0(fig_path, "/arbre.png")) 
arbrex8 <- magick::image_read(paste0(fig_path, "/arbrex8.png"))

arbre_compo <- image_blank(width = 1200, height = 500, color = 'white') %>%
  image_composite(
    composite_image = image_scale(arbrex8, paste0("x", img_size$height/6)), 
    gravity = "southwest", 
    offset = "+100+100") %>%
  image_composite(
    composite_image = image_scale(arbre, paste0("x", img_size$height/4)),
    gravity = "southwest", 
    offset = "+400+100"
  ) %>%
  image_composite(
    composite_image = image_scale(arbrex8, paste0("x", img_size$height/2)),
    gravity = "southwest", 
    offset = "+650+100"
  )
arbre_compo

plan <- arbre_compo %>%
  image_draw()
## Image top text
text(170, 280, bquote(italic("n") ~ "/2 trees"), family = "palatino", cex = 2)
text(450, 230, "Volume?"                       , family = "palatino", cex = 2)
text(890, 80, bquote(italic("n") ~ "/2 trees"), family = "palatino", cex = 2)
## Bottom arrow
rect(xleft = 100, xright = 1040, ybottom = 419, ytop = 420)
text(1035, 421, ">", cex = 3)
## Bottom text
text(1120, 415, bquote("Size" ~ (italic(D^2*H))), family = "palatino", cex = 2)
text(450, 440, bquote(italic(D^2*H)), family = "palatino", cex = 2)
text(300, 480, bquote(Delta), family = "palatino", cex = 2)
text(600, 480, bquote(Delta), family = "palatino", cex = 2)
## Bottom left bracket
rect(xleft = 170, xright = 430, ybottom = 469, ytop = 470)
rect(xleft = 170, xright = 171, ybottom = 470, ytop = 460)
rect(xleft = 429, xright = 430, ybottom = 470, ytop = 460)
## Bottom right bracket
rect(xleft = 470, xright = 730, ybottom = 469, ytop = 470)
rect(xleft = 470, xright = 471, ybottom = 470, ytop = 460)
rect(xleft = 729, xright = 730, ybottom = 470, ytop = 460)

dev.off()
#image_write(plan, path = paste0(fig_path, "/plan.png")) ## Not needed on Windows


###
### Figures chapter 3 ----------------------------------------------------------

###
### compart
###

## Convert pdf to png -- RUN ONE TIME ONLY
compart <- magick::image_read_pdf(paste0(fig_path, "/comparts.pdf"))

compart_all <- image_blank(width = 1200, height = 700, color = 'white') %>%
  image_composite(
    composite_image = image_scale(compart, paste0("x", img_size$height)), 
    gravity = "southwest", 
    offset = "+20+20") %>%
  image_draw()
text(400, 200, "Leaves: total weight and sample taken for
moisture content", cex = 2.5, adj = c(0,NA), family = "serif")
text(370, 320, bquote({"Branches (cross cuts \U2205" >= "20 cm; 20 cm > \U2205"} >= "7 cm;"),
     cex = 2.5, adj = c(0,NA), family = "serif")
text(370, 350, bquote("7 cm  > \U2205" >= "4 cm; 4 cm > \U2205): weighed and sample taken of"),
     cex = 2.5, adj = c(0,NA), family = "serif")
text(370, 380, bquote("cross cuts for moisture content"),
     cex = 2.5, adj = c(0,NA), family = "serif")
text(320, 470, "Trunk (wood and bark): logs weighed and disks cut every 2 m ",
     cex = 2.5, adj = c(0,NA), family = "serif")
text(320, 500, "for moisture content and wood/bark proportion", 
     cex = 2.5, adj = c(0,NA), family = "serif")
text(480, 570, bquote({"Roots (cross cuts \U2205" >= "10 mm; 10 mm > \U2205"} >= "2 mm;"),
     cex = 2.5, adj = c(0,NA), family = "serif")
text(480, 600, bquote("2 mm >" ~ "\U2205): weighed and sample taken by"),
     cex = 2.5, adj = c(0,NA), family = "serif")
text(480, 630, bquote("cross-cutting for moisture content"),
     cex = 2.5, adj = c(0,NA), family = "serif")

dev.off()

###############################################################################
###############################################################################

## New approach to graphic devices
## Install Ghostscript https://www.ghostscript.com/download/gsdnld.html and set path in Sys.setenv
Sys.setenv(R_GSCMD = normalizePath("C:/Program Files/gs/gs9.53.3/bin/gswin64c.exe")) 


#grImport::PostScriptTrace(paste0(fig_path, "/eps/arbre.eps"), paste0(fig_path, "/xml/comparts.eps.xml"))
#comparts_vec <- grImport::readPicture(paste0(fig_path, "/xml/comparts.eps.xml"))

grImport::PostScriptTrace(paste0(fig_path, "/comparts.pdf"), paste0(fig_path, "/xml/comparts.pdf.xml"))
comparts_vec <- grImport::readPicture(paste0(fig_path, "/xml/comparts.pdf.xml"))

grImport::grid.picture(comparts_vec)



