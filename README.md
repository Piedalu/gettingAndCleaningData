gettingAndCleaningData
======================

Getting and Cleaning Data Course Project


Requirements
======================
First of all, this little R script objective is to process raw data from the source below:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R require that you have downloaded and unzip the source directory "UCI HAR Dataset" in the same working directory before processing.


The script also require that you already have installed the "dplyr" package.
You can use the command below to do so:

install.packages("dplyr")


Purpose of the script
=====================
- Load the datasets from train and test directory.
- Merge datas from both datasets and descriptive labels and names. (you can retrieve this datas in completeData)
- Extracts only the measurements on the mean and standard deviation for each measurement. (intermediary datas in completeDataMS)
- Create an independent tidy data set with the average of each variable for each activity and each subject (see completeMean)

