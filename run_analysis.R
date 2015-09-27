## The purpose of this script is to create a tidy data set derived from activity
## data obtained from a group of test subjects who were outfitted with a
## smartphone on their waists and observed performing different activities.
##
## More information about the raw data is available at:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## Ultimately, this script will calculate the means of a number of variables
## (means and standard deviations amongst the different features) for every
## subject and activity.
##
## This script requires the UCI HAR Dataset to be unzipped and in the same
## folder as the script. The dataset can be obtained from here:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## load dplyr, needed towards the end of the script
library(dplyr)

## get training dataset
trainingData <- read.table("UCI HAR Dataset/train/X_train.txt",
	header = FALSE)
trainingDataLabels <- read.table("UCI HAR Dataset/train/y_train.txt",
	header = FALSE)
trainingSubject <- read.table("UCI HAR Dataset/train/subject_train.txt",
	header = FALSE)

## get test dataset
testData <- read.table("UCI HAR Dataset/test/X_test.txt",
	header = FALSE)
testDataLabels <- read.table("UCI HAR Dataset/test/y_test.txt",
	header = FALSE)
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt",
	header = FALSE)

## get variable names for test and training data and assign column names
features <- read.table("UCI HAR Dataset/features.txt",
	header = FALSE,
	row.names = 1,
	stringsAsFactors = FALSE)
colnames(trainingData) <- features[, 1]
colnames(testData) <- features[, 1]

## add training subject identities and activity names to datasets
trainingData2 <- cbind(trainingSubject, trainingDataLabels, trainingData)
colnames(trainingData2)[1:2] <- c("subject", "activity")
testData2 <- cbind(testSubject, testDataLabels, testData)
colnames(testData2)[1:2] <- c("subject", "activity")

## merge training and test data
mergedData <- rbind(trainingData2, testData2)

## extract only means and standard deviations
relevantVars <- grep("mean|std", colnames(mergedData), ignore.case = TRUE)
relevantCols <- c(1, 2, relevantVars)
relData <- mergedData[relevantCols]

## get activity descriptions
activities <- read.table("UCI HAR Dataset/activity_labels.txt",
	header = FALSE,
	row.names = 1,
	stringsAsFactors = FALSE)
relData[, 2] <- as.factor(relData[, 2])
levels(relData[, 2]) <- activities[, 1]

## summarize data
relDataTbl <- tbl_df(relData)
grpData <- group_by(relDataTbl, subject, activity)
sumData <- summarize_each(grpData, "mean")

## fix column names of summarized data
tempnames <- colnames(sumData)[3:ncol(sumData)]
tempnames2 <- gsub("(\\(\\))", "", tempnames)
tempnames3 <- gsub("-|)", "", tempnames2)
tempnames4 <- gsub("\\(|,", ".", tempnames3)
tempnames5 <- paste(tempnames4, "Avg", sep=".")
colnames(sumData)[3:ncol(sumData)] <- tempnames5

## write tidy data to file
write.table(sumData, file = "means.txt", row.names = FALSE)