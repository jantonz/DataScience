run_analysis <- function() {
    library(dplyr)
    library(tidyr)
    
    #1.Merging the training and the test sets
        #1.1. Reading the files
    x_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep="")
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt", sep="")
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep="")
    x_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep="")
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt", sep="")
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep="")
    
        #1.2. Merging the files
    x <- rbind(x_train, x_test)
    y <- rbind(y_train, y_test)
    subject <- rbind(subject_train, subject_test)
    data <- cbind(subject, y, x)
    
    #4.Appropriately labeling the data set with descriptive variable names. 
    features <- read.table("UCI HAR Dataset/features.txt", sep="")
    features_character <- (as.character(features[[2]]))
    colnames(data) <- c("subject", "activity", features_character)
    data_names <- make.names(colnames(data), unique=TRUE)
    colnames(data) <- data_names

    
    #2.Extracting only the measurements on the mean and standard deviation
    #Be aware that the first column is "data", the second is "subject", then all the columns with
    #"mean" in their name, and then all the columns with "std" in their name
    data_selected <- select(data, subject, activity, contains("mean"), contains("std"))
    
    #3.Naming the activities in the data set
    activity_labels <- factor(data_selected$activity, levels = c(1,2,3,4,5,6), labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))
    data_selected$activity <- activity_labels
    
    #5.Creating an independent tidy data set with the average of each variable for each activity 
    #and each subject.
        #5.1. Grouping the data by activity and subject
    data_grouped <- group_by(data_selected, activity, subject)
        #5.2. Extracting the mean for each activity and subject combination (180 rows)
    data_avg <- summarise_each(data_grouped, funs(mean))
        #5.3. Creating a text file
    write.table(data_avg, file = "data_avg.txt", row.names = FALSE)
    
}
    