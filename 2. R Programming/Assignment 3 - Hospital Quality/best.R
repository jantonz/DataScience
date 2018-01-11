best <- function(state, outcome, num = "best") {
    
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
    table2 <- split(table, states)
    table3 <- table2[[state]]
    
    if (outcome == "heart attack") {
        table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack), ]   
        a <- as.character((table4[1,2]))
        return(a)
    }
    else if (outcome == "heart failure") {
        table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure), ]        
        a <- as.character((table4[1,2]))
        return(a)        
    }
    else if (outcome == "pneumonia") {
        table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia), ] 
        a <- as.character((table4[1,2]))
        return(a)        
    }
    
}
