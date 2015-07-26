## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)

featureNames <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)

subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

##Step 1 - Merge the training and the test sets to create one data set

subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)
colnames(features) <- t(featureNames[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
completeData <- cbind(features,activity,subject)

##Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement

columnsWithMeanSTD <- grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)
requiredColumns <- c(columnsWithMeanSTD, 562, 563)
Data <- completeData[,requiredColumns]

##Step 3 - Uses descriptive activity names to name the activities in the data set

Data$Activity <- as.character(Data$Activity)
for (i in 1:6){
  Data$Activity[Data$Activity == i] <- as.character(activityLabels[i,2])
}

##Step 4 - Appropriately labels the data set with descriptive variable names

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

##Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

Data <- data.table(Data)
tidyData<-Data[,lapply(.SD,mean),by="Subject,Activity"]
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
