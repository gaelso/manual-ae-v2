
## Custom display table function that adapt to TeX (pdf), html (gitbook) or docx
display_table <- function(need_lscp = FALSE){
  
  if (book_format == "latex") {
    
    if (need_lscp == FALSE) {
      
      tt <- do.call(kable, c(kab_opt, format = book_format)) %>%
        kableExtra::kable_styling(position = 'center', latex_options = c("HOLD_position", "repeat_header"))
      
    } else if (need_lscp == TRUE) {
      
      tt <- do.call(kable, c(kab_opt, format = book_format)) %>%
        kableExtra::kable_styling(position = 'center', latex_options = c("HOLD_position", "scale_down", "repeat_header")) %>%
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
