
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

plan <- image_blank(width = 1200, height = 600, color = 'white') %>%
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
plan

