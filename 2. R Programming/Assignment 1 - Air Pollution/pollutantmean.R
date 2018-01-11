#pollutantmean.R
#13/01/2015

pollutantmean <- function(directory, pollutant, id = 1:332) {
    llista.fitxers <- list.files(path=directory, full.names=TRUE)
    llista.fitxers.bona <- llista.fitxers[id]
    mymean <- 0
    y <- matrix(, 0, 4)
    if(pollutant=="sulfate"){
            for(i in 1:length(id)){
                x <- read.csv(llista.fitxers.bona[i])
                y <- rbind(x,y)
            }
            mymean <- colMeans(y[2], na.rm=TRUE)
            print(mymean)
    }
    else if(pollutant=="nitrate"){
            for(i in 1:length(id)){
                x <- read.csv(llista.fitxers.bona[i])
                y <- rbind(x,y)
            }
            mymean <- colMeans(y[3], na.rm=TRUE)
            print(mymean)
    }
    
    else{print("Repeat your pollutant, please")}
}