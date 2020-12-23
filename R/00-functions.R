
###
### Adapt kable to TeX (pdf), html (gitbook) or docx ---------------------------

display_table <- function(need_lscp = FALSE){
  
  if (book_format == "latex") {
    
    if (need_lscp == FALSE) {
      tt <- do.call(kable, c(kab_opt, format = book_format)) %>%
        kableExtra::kable_styling(
          position = 'center', 
          latex_options = c("repeat_header") ## removed for this book: "HOLD_position", 
          )
    } else if (need_lscp == TRUE) {
      tt <- do.call(kable, c(kab_opt, format = book_format)) %>%
        kableExtra::kable_styling(
          position = 'center', 
          latex_options = c("HOLD_position", "scale_down", "repeat_header")
          ) %>%
        kableExtra::landscape()
    } else {
      stop("Error need_lscp should be TRUE/FALSE")
    } ## End if need_lscp
    
  } else if (book_format == "html") {
    
    tt <- do.call(kable, c(kab_opt, format = book_format)) %>%
      kableExtra::kable_styling(full_width = F)
    
  } else {
    
    tt <- do.call(kable, kab_opt)
    
  } ## End if book_format
  
  return(tt)
  
} ## End function


###
### Convert pdf to png for html output -----------------------------------------
pdf2png <- function(path) {
  # only do the conversion for non-LaTeX output
  if (knitr::is_latex_output()) 
    return(path)
  path2 <- xfun::with_ext(path, "png")
  img <- magick::image_read_pdf(path)
  magick::image_write(img, path2, format = "png")
  path2
}
