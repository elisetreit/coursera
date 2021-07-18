best <- function(state, outcome){
  data <- read.csv('Assignment_3/outcome-of-care-measures.csv')
  check_if_valid(state, outcome, data)
  hosp <- data[data$State == state, ]
  best <- character()
  if(outcome == "heart attack"){
    min_val <- min(as.numeric(hosp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), 
                   na.rm = TRUE)
    best <- hosp[hosp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == min_val ,]
  }
  if(outcome == "heart failure"){
    min_val <- min(as.numeric(hosp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), 
                   na.rm = TRUE)
    best <- hosp[hosp$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure == min_val ,]
    
  }
  if(outcome == "pneumonia"){
    min_val <- min(as.numeric(hosp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), 
                   na.rm = TRUE)
    best <- hosp[hosp$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia == min_val ,]
  }
  names <- best$Hospital.Name
  head(sort(names, decreasing = FALSE), 1)
}
check_if_valid <- function(state, outcome, data){
  valid_states <- unique(data$State)
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if(!state %in% valid_states){
    stop("invalid state")
  }
  if(!outcome %in% valid_outcomes){
    stop("invalid outcome")
  }
}