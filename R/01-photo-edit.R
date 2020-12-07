
###
### Setup ----------------------------------------------------------------

img_path <- "source/photo_lowres"
fig_path <- "source/figures"
#img_edits <- "images/photo_edited"

img_size <- list(height = 600, width = 1200)


###
### prepare photos --------------------------------------------------------

## euca
eucal1 <- magick::image_read(paste0(img_path, "/eucalyptus1.jpg")) 
eucal2 <- magick::image_read(paste0(img_path, "/eucalyptus2.jpg")) 

euca <- c(eucal1, eucal2) %>%
  image_scale(paste0(img_size$width, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "0x5") %>%
  magick::image_append(stack = TRUE)
euca

## mix
mixcan   <- magick::image_read(paste0(img_path, "/mixcan.jpg")) 
mixcosta <- magick::image_read(paste0(img_path,"/mixcosta.jpg")) 

mix <- c(mixcan, mixcosta) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x0") %>%
  image_append()
mix

## plan
arbre   <- magick::image_read(paste0(fig_path, "/arbre.png")) 
arbrex8 <- magick::image_read(paste0(fig_path, "/arbrex8.png"))

arbre_compo <- image_blank(width = 1200, height = 600, color = 'white') %>%
  image_composite(
    composite_image = image_scale(arbrex8, paste0("x", img_size$height/6)), 
    gravity = "southwest", 
    offset = "+100+200") %>%
  image_composite(
    composite_image = image_scale(arbre, paste0("x", img_size$height/4)),
    gravity = "southwest", 
    offset = "+400+200"
  ) %>%
  image_composite(
    composite_image = image_scale(arbrex8, paste0("x", img_size$height/2)),
    gravity = "southwest", 
    offset = "+650+200"
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
text(300, 500, bquote(Delta), family = "palatino", cex = 2)
text(600, 500, bquote(Delta), family = "palatino", cex = 2)
## Bottom left bracket
rect(xleft = 170, xright = 430, ybottom = 479, ytop = 480)
rect(xleft = 170, xright = 171, ybottom = 480, ytop = 470)
rect(xleft = 429, xright = 430, ybottom = 480, ytop = 470)
## Bottom right bracket
rect(xleft = 470, xright = 730, ybottom = 479, ytop = 480)
rect(xleft = 470, xright = 471, ybottom = 480, ytop = 470)
rect(xleft = 729, xright = 730, ybottom = 480, ytop = 470)

dev.off()
image_write(plan, path = paste0(fig_path, "/plan.png"))



