source("pollutantmean.R")
complete <- function(directory = "specdata", id = 1:332){
  comp <- data.frame(id = integer(), nobs = integer())
  for(i in id){
    dat <- read.csv(get_path(i, directory))
    #try dropping nulls?
    dat <- na.omit(dat)
    val <- nrow(dat)
    newentry <- data.frame(id = i, nobs = val)
    comp <- rbind(comp, newentry)
  }
  comp
}