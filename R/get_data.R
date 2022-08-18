#'
#' get_data(url)
#' @param url
get_data <- function(url) {

  run <- read.csv(url,header=TRUE) %>% 
  	clean_names() 
  return(run)

}
