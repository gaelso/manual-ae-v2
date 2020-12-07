
###
### Setup ----------------------------------------------------------------

img_path  <- "images/photo_lowres"
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
arbre <- magick::image_read("images/figures/arbre.png") 
arbrex8 <- magick::image_read("images/figures/arbrex8.png") 

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
  image_montage(geometry = "100%x100%", tile = "3x1", gravity = 'south', bg='white') 
text(330, 270, "n/2 trees", family = "monospace", cex = 1.5)
text(970, 220, "Volume?", family = "monospace", cex = 1.5)
text(1620, 80, "n/2 trees", family = "monospace", cex = 1.5)
#abline(h = 420)
#abline(v = 330:1620, col = "red", cex = 1)
rect(ybottom = 419, ytop = 420, xleft = 300, xright = 1800)
text(1800, 420, ">", cex = 2)
text(1900, 420, "Size (D^2^H)", family = "monospace", cex = 1.5)
text(970, 450, "(ref:plan-d2h)", family = "monospace", cex = 1.5)
text(620, 470, "(ref:delta)", family = "monospace", cex = 1.5 )
text(620, 460, "}", srt = -90, cex = 10)
plan

