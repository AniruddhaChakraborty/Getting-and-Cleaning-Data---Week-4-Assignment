library(dplyr)
##Downloading and unzipping dataset
if (!file.exists("Dataset.zip")){
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="Dataset.zip")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip("Dataset.zip")
}

# read train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
Sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# read test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
Sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read feature vector
features <- read.table('./UCI HAR Dataset/features.txt')

# read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## 1. Merge the training and the test sets to create one data set.
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
Sub_total <- rbind(Sub_train, Sub_test)

# Naming the columns
colnames(Sub_total) <- "subjectId"
colnames(X_total) <- features[,2]
colnames(Y_total) <-"activityId"
colnames(activity_labels) <- c('activityId','activityType')

# Merge X,Y and Sub data sets into one data set
merged_data <- cbind(Y_total, Sub_total, X_total)

## 2. Extract only the measurements on the mean and standard deviation for each measurement.

# remove duplicate columns
merged_data <- merged_data[ , !duplicated(colnames(merged_data))]

merged_data <- merged_data %>% select(activityId,subjectId,contains("mean"),contains("std"))
merged_data <- merged_data %>% select(-starts_with("angle"),-contains("meanFreq"))

## 3. Use descriptive activity names to name the activities in the data set.
merged_data <- merged_data %>% inner_join(activity_labels)

## 4. Appropriately label the data set with descriptive variable names.

# This is already done in step 1

# Naming the columns
# colnames(Sub_total) <- "subjectId"
# colnames(X_total) <- features[,2]
# colnames(Y_total) <-"activityId"

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
summary <- merged_data %>% select(-activityId)%>%group_by(subjectId,activityType)
summary <- summary %>% summarize_each(funs(mean))
write.table(summary, file = "tidy-data.txt", row.name = FALSE)
print("Tidy dataset created.")






