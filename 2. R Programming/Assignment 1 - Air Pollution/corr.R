#corr.R
#16/01/2015

corr <- function(directory, threshold = 0) {
    files <- list.files(path=directory, full.names=TRUE)
    corvector <- 
    data <- NULL
    for (i in 1:332) {
        a <- read.csv(files[i])
        b <- na.omit(a)
        c <- nrow(b)
            if (c <= threshold) {
                next
            }
            else {
                Sulfate <- b$sulfate
                Nitrate <- b$nitrate
                data <- data.frame(Sulfate, Nitrate)
                correlacio <- cor(x=data$Sulfate, y=data$Nitrate)
                }
        corvector <- c(corvector, correlacio)
    }
    if (is.null(corvector)) {print(numeric())}
    else{
    print(corvector)}
    
}
    