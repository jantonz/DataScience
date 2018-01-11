#complete.R
#15/01/2015

complete <- function(directory, id = 1:332) {
    llista.fitxers <- list.files(path=directory, full.names=TRUE)
    llista.fitxers.bona <- llista.fitxers[id]
    y <- NULL
    for(i in 1:length(id)){
        x <- read.csv(llista.fitxers.bona[i])
        complet <- sum(complete.cases(x[2]) & complete.cases(x[3]))
        #a <- sum(complete.cases(x[2]))
        #b <- sum(complete.cases(x[3]))
        #c <- min(a,b)
        #a <- sum(!is.na(x[2]))
        #b <- sum(!is.na(x[3]))
        #c <- min(a,b)
        y <- rbind(y, data.frame("id"=id[i], "nobs"=complet))
    }
    print(y)
}