

###
### Setup ----------------------------------------------------------------------

fig_path <- "source/figures"


###
### figures chapter 2 ----------------------------------------------------------

###
### plan
###

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
### figures chapter 3 ----------------------------------------------------------

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
#text(400, 400, TeX("$\\varnothing$"), cex = 2, adj = c(0,NA), family = "serif")
#text(400, 400, bquote("\U2300"), cex = 2, adj = c(0,NA), family = "serif")
text(400, 400, bquote("\U00F8"), cex = 2, adj = c(0,NA), family = "serif")
text(450, 400, bquote("\U2205"), cex = 2, adj = c(0,NA), family = "serif")
text(500, 600, 
     bquote("Roots (cross cut "), 
     cex = 2, adj = c(0,NA), family = "serif")
text(300, 480, "Trunk (wood and bark): logs weighed and disks cut every 2 m 
for moisture content and wood/bark proportion", 
cex = 2, adj = c(0,NA), family = "serif")


compart_all


