pollutantmean <- function(directory, pollutant, id = 1:332){
  #get vector of all means in directory
  pol_mean <- numeric(length = length(id))
  for(i in id){
    path <- get_path(directory, i)
    dat <- read.csv(path)
    pol_mean[i] <- mean(dat[, pollutant], na.rm = TRUE)
  }
  #get average of vector
  mean(pol_mean, na.rm = TRUE)
}

get_path <- function(directory, id){
  ival <- if(i<10){
    paste('00', i, sep = "")
  } else if (i < 100){
    paste('0', i, sep = "")
  } else {
    i
  }
  paste(directory, "/", ival, ".csv", sep = "")
}
  
