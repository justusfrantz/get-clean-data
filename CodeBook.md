##Getting and Cleaning Data Course Project


The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
This codebook describes the variables, the data, transformations that is performed to clean up the data.


##Data for the project is downloaded from link below: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##Description for the data is given as follows:

The source files that is used to create the tidy data set from the unzipped data archive are:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

NOTE: We do not use the Inertial Signals for this tidy data set.


##Transformations

Preliminary work - read the following files and assign to the respective variables

- 'features.txt'-> featureNames
- 'activity_labels.txt'-> activityLabels
- 'train/subject_train.txt' -> subjectTrain
- 'train/y_train.txt'-> activityTrain
- 'train/X_train.txt'-> featuresTrain
- 'test/subject_test.txt' -> subjectTest
- 'test/y_test.txt' -> activityTest
- 'test/X_test.txt'-> featuresTest

##Step 1 - Merge the training and the test sets to create one data set
The merged data set is called completeData

##Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
Extracts only the measurements on the mean and standard deviation for each measurement from completeData.
Result is named as Data.

##Step 3 - Uses descriptive activity names to name the activities in the data set
Descriptive activity names is taken from activityLabels to name the activities in Data.

##Step 4 - Appropriately labels the data set with descriptive variable names
variable/column names were labeled with descriptive cleaner names as follows:
t renamed as Time
f renamed as frequency
Acc renamed as Accelerometer
Gyro renamed as Gyroscope
Mag renamed as Magnitude
BodyBody renamed as Body


##Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
The average of each variable for Data is calculated and named as tidyData which is subsequently ordered by Subject and Activity.
Results from tidyData were output as an independent tidy data set at the working directory file named as Tidy.txt
