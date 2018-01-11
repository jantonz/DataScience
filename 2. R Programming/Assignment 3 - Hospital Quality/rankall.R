rankall <- function(outcome, num = "best") {
    
    ## Read outcome data
    table_full <- read.csv("outcome-of-care-measures.csv", stringsAsFactors=FALSE, na.strings=c("Not Available"))
    table_subset <- subset(table_full, select= c("State", "Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"))
    table <- table_subset #fent proves...
    ranking <- data.frame(NULL)
    
    ## Check that state and outcome are valid
    #States
    states <- as.factor(table[, 1])
    state_names <- levels(as.factor(table[, 1]))
    #logic_state_names <- state == state_names
    #if (sum(logic_state_names) == 0) {stop("invalid state")}
    #Outcome:
    if ((outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia") == TRUE) {
        stop("invalid outcome")}
    
    ## For each state, find the hospital of the given rank
    if (num == "best") {num <- 1}
    table2 <- split(table, states)
    
    if (outcome == "heart attack") {
        for (i in 1:54) {
            table3 <- table2[[i]]
            table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, table3$Hospital.Name), ]
            table5 <- subset(table4, select = c("State", "Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"))
            table6 <- na.omit(table5)
            if (num == "worst") {num2 <- length(table6$Hospital.Name)}
            ranking <- rbind(ranking, data.frame("hospital"=table6[num2,2], "state"=state_names[i])) 
        }
    }
    else if (outcome == "heart failure") {
        for (i in 1:54) {
            table3 <- table2[[i]]
            table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, table3$Hospital.Name), ]
            table5 <- subset(table4, select = c("State", "Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"))
            table6 <- na.omit(table5)
            if (num == "worst") {num2 <- length(table6$Hospital.Name)}
            ranking <- rbind(ranking, data.frame("hospital"=table6[num2,2], "state"=state_names[i])) 
        }
    }
    else if (outcome == "pneumonia") {
        for (i in 1:54) {
            table3 <- table2[[i]]
            table4 <- table3[ order(table3$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, table3$Hospital.Name), ]
            table5 <- subset(table4, select = c("State", "Hospital.Name","Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"))
            table6 <- na.omit(table5)
            if (num == "worst") {num2 <- length(table6$Hospital.Name)}
            ranking <- rbind(ranking, data.frame("hospital"=table6[num2,2], "state"=state_names[i])) 
        }
    }    
    
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    return(ranking)
}