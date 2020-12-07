
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

arbrex8_1 <- arbrex8 %>% 
  image_scale(paste0("x", img_size$height/6)) %>% 
  image_background("white") %>% 
  image_border("white", "0x100")
arbre_1 <- arbre %>% 
  image_scale(paste0("x", img_size$height/4)) %>% 
  image_border("white", "100x100")
arbrex8_2 <- arbrex8 %>% 
  image_scale(paste0("x", img_size$height/2)) %>% 
  image_background("white") %>% 
  image_border("white", "100x100")

plan <- c(arbrex8_1, arbre_1, arbrex8_2) %>%
  image_montage(geometry = "100%x100%", tile = "3x1", gravity = 'south', bg='white') %>%
  image_draw()
## Image top text
text(330, 270, "n/2 trees", family = "monospace", cex = 1.5)
text(970, 220, "Volume?", family = "monospace", cex = 1.5)
text(1620, 80, "n/2 trees", family = "monospace", cex = 1.5)
## Bottom arrow
rect(xleft = 250, xright = 1800, ybottom = 419, ytop = 420)
text(1800, 420, ">", cex = 2)
## Bottom text
text(1900, 420, "Size (D^2^H)", family = "monospace", cex = 1.5)
text(970, 440, "(ref:plan-d2h)", family = "monospace", cex = 1.5)
text(620, 480, "(ref:delta)", family = "monospace", cex = 1.5 )
text(1400, 480, "(ref:delta)", family = "monospace", cex = 1.5 )
## Bottom left bracket
rect(xleft = 300, xright = 960, ybottom = 464, ytop = 465)
rect(xleft = 300, xright = 301, ybottom = 465, ytop = 450)
rect(xleft = 959, xright = 960, ybottom = 465, ytop = 450)
## Bottom right bracket
rect(xleft = 980, xright = 1750, ybottom = 464, ytop = 465)
rect(xleft = 980, xright = 981, ybottom = 465, ytop = 450)
rect(xleft = 1749, xright = 1750, ybottom = 465, ytop = 450)
dev.off()
plan

