rankhospital <- function(state, outcome, num = "best") {
    
    ## Read outcome data
    table_full <- read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE, na.strings=c("Not Available"))
    table_subset <- subset(table_full, select= c("State", "Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"))
    table <- na.omit(table_subset)
    
    ## Check that state and outcome are valid
    #States
    states <- as.factor(table[, 1])
    state_names <- levels(as.factor(table[, 1]))
    logic_state_names <- state == state_names
    if (sum(logic_state_names) == 0) {stop("invalid state")}
    
    #Outcome:
    if ((outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia") == TRUE) {
        stop("invalid outcome")}
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    if (num == "best") {num <- 1}
    table2 <- split(table, states)
    table3 <- table2[[state]]
    if (num == "worst") {num <- length(table3$Hospital.Name)}
    
    if (outcome == "heart attack") {
        table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, table3$Hospital.Name), ]   
        a <- as.character((table4[num,2]))
        return(a)
    }
    else if (outcome == "heart failure") {
        table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, table3$Hospital.Name), ]        
        a <- as.character((table4[num,2]))
        return(a)        
    }
    else if (outcome == "pneumonia") {
        table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, table3$Hospital.Name), ] 
        a <- as.character((table4[num,2]))
        return(a)        
    }
    
}
