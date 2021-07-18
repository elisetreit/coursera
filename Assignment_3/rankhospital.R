source("Assignment_3/best.R")
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("Assignment_3/outcome-of-care-measures.csv")
  ## Check that state and outcome are valid
  check_if_valid(state, outcome, data)
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  hosp.list <- get_hosp_var(state, outcome, data)
  ranked <- hosp.list[order(hosp.list$Rate, hosp.list$Hospital.Name), ]
  if(num == "best"){
    hosp_name <- ranked[1, "Hospital.Name"]
  }
  if(num == "worst"){
    hosp_name <- tail(ranked, 1)$Hospital.Name
  }
  else {
    hosp_name <- ranked[num, "Hospital.Name"]
  }
  hosp_name
}
get_hosp_var <- function(state, outcome, data){
  temp <- data[data$State == state, ]
  if(outcome == "heart attack"){
    temp <- temp[, c("State", "Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")]
    names(temp) <- c("State", "Hospital.Name", "Rate")
  }
  if(outcome == "heart failure"){
    temp <- temp[, c("State", "Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")]
    names(temp) <- c("State", "Hospital.Name", "Rate")
  }
  if(outcome == "pneumonia"){
    temp <- temp[, c("State", "Hospital.Name", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")]
    names(temp) <- c("State", "Hospital.Name", "Rate")
  }
  temp
  
}