add2 <- function(x, y){
  x+y
}
above10 <- function(x){
  use <- x>10 #creates logical vector, T, F
  x[use] #selects values that are true in use
}

above <- function(x, n){
  use <- x>n
  x[use]
}