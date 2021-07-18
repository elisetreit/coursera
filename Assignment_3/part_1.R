outcome <- read.csv("Assignment_3/outcome-of-care-measures.csv", 
                    colClasses = 'character')
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11], main = "Death Rates from Heart Attack",
                    xlab = "death rate per 30 days")