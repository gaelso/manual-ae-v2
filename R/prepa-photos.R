

###
### Photos Chapter 1 -----------------------------------------------------------

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


###
### Photos Chapter 3 -----------------------------------------------------------

## arriv
arrivee1 <- magick::image_read(paste0(img_path, "/arrivee1.jpg"))  
arrivee2 <- magick::image_read(paste0(img_path, "/arrivee2.jpg"))  

arriv <- c(arrivee2, arrivee1) %>%
  image_scale(paste0(img_size$width, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "5x5") %>%
  magick::image_append()
arriv


## congo
congo1 <- magick::image_read(paste0(img_path, "/congo1.jpg"))  
congo2 <- magick::image_read(paste0(img_path, "/congo2.jpg"))  

congo <- c(congo1, congo2) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
congo


## gha
profil1 <- magick::image_read(paste0(img_path, "/profil1.jpg"))  
profil2 <- magick::image_read(paste0(img_path, "/profil2.jpg"))  

gha <- c(profil1, profil2) %>%
  image_scale(paste0(img_size$width, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "5x5") %>%
  magick::image_append()
gha


## thai
thai1 <- magick::image_read(paste0(img_path, "/thailand1.jpg"), density = "72x72")  
thai2 <- magick::image_read(paste0(img_path, "/thailand2.jpg"), density = "72x72")  

thai <- c(thai1, thai2) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
thai


