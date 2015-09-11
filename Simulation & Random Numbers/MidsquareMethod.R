midSquare <- function(int){
  
  n <- nchar(int)
  int <- int^2
  m <- nchar(int)
  
  if(m%%2 == 0){  
    mid <- (m/2)
  } else {
    mid <- ceiling(m/2)
  }
  
  if(n%%2 == 0){
    start <- mid - (n/2 - 1)
  } else {
    start <- mid - floor(n/2)
  }
  
  end <- start + n
  
  res <- as.numeric(substr(int, start, end))
  return(res)
}