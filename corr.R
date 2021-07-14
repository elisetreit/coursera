
corr <- function(directory = "specdata", threshold = 0){
  source("complete.R")
  df.counts <- complete()
  df.thresh <- data.frame()
  df.thresh <- df.counts[df.counts$nobs >= threshold ,]
  cor.vec <- numeric(length = 0L)
  id_list <-df.thresh$id
  for(id in id_list){
    dat <- read.csv(get_path(id, directory))
    dat <- na.omit(dat)
    cor1 <- cor(dat$sulfate, dat$nitrate)
    cor.vec <- c(cor.vec, cor1)
  }
  cor.vec
}