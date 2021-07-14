
corr <- function(directory = "specdata", threshold = 0){
  source("complete.R")
  df.counts <- complete()
  df.thresh <- df.counts[df.counts$dobs >= threshold]
  cor.vec <- numeric(length = 0L)
  for(id in df.thresh$id){
    dat <- read.csv(get_path(id, directory))
    dat <- na.omit(dat)
    cor.vec <- c(cor.vec, cor(dat$sulfate, dat$nitrate))
  }
}