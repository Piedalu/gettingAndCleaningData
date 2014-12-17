## run_analysis.R 
## Purpose of the script:
# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for
#     each measurement. 
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.

library(dplyr)

## Loading files
training <- read.table("UCI HAR Dataset/train/X_train.txt")
test <- read.table("UCI HAR Dataset/test/X_test.txt")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
trainingSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merging datas (and descriptive labels and names)
colnames(training) <- features[,2]
colnames(test) <- features[,2]
colnames(trainingSubject) <- "subject"
colnames(testSubject) <- "subject"

training <- cbind(trainingSubject,training)
test <- cbind(testSubject,test)

replacement <- function(x)
{
  return(activityLabels[activityLabels$V1==x,]$V2)
}

training["activity"] <- sapply(trainLabels$V1, replacement)
test["activity"] <- sapply(testLabels$V1, replacement)

completeData <- rbind(training,test) 

## limit to mean and std datas
completeDataMS <- cbind(completeData[,c("subject","activity")],completeData[,grep("mean|std",colnames(completeData))])

completeMean <- aggregate(completeDataMS[,c(3:81)],list(activity=completeDataMS$activity,subject=completeDataMS$subject),mean)
