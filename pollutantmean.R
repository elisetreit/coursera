#potentially wrong approach: this will weight all equally, rather weight ones
#with more observations more heavily
pollutantmean <- function(directory = "specdata", pollutant, id = 1:332){
  dat_val <- numeric()
  for(i in seq_along(id)){
    dat <- read.csv(get_path(id[i], directory))
    dat_val <- append(dat_val, dat[, pollutant])
  }
  mean(dat_val, na.rm=TRUE)
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

  
