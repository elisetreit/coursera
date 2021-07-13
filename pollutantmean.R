pollutantmean <- function(directory = "specdata", pollutant, id = 1:332){
  #get vector of all means in directory
  pol_mean <- numeric(length = length(id))
  #this index thing is kinda hacky, try to fix later
  index = 1
  for(i in id){
    path <- get_path(i, directory)
    dat <- read.csv(path)
    pol_mean[index] <- mean(dat[, pollutant], na.rm = TRUE)
    index = index + 1
  }
  #get average of vector
  mean(pol_mean, na.rm = TRUE)
}

get_path <- function(file_n, directory = "specdata"){
  ival <- if(file_n<10){
    paste('00', file_n, sep = "")
  } else if (file_n < 100){
    paste('0', file_n, sep = "")
  } else {
    file_n
  }
  paste(directory, "/", ival, ".csv", sep = "")
}
  
