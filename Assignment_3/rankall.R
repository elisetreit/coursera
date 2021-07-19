source("Assignment_3/rankhospital.R")
rankall <- function(outcome, num = "best"){
  #loading data
  data <- read.csv("Assignment_3/outcome-of-care-measures.csv")
  #check if outcome is valid
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!outcome %in% valid_outcomes){
    stop("invalid outcome")
  }
  #get list of state names
  state.names <- unique(data$State)
  state.names <- sort(state.names)
  
  #find hospital for rank of outcome in each state, add to dataframe
  state.ranks <- data.frame(matrix(ncol = 2, nrow = 0))
  colnames(state.ranks) <- c("State", "Hospital")
  for(state in state.names){
    #find hospital at given rank for outcome
    hosp_name <- rankhospital(state, outcome, num)
    state.ranks[nrow(state.ranks) + 1, ] <- c(state, hosp_name)
  }
  state.ranks
}



