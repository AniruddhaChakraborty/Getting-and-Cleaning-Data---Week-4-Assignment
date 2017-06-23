# CodeBook

# Source Data

The experiments were carried out with a group of 30 volunteers. They performed a protocol of activities composed of six basic activities: three static postures (standing, sitting, lying) and three dynamic activities (walking, walking downstairs and walking upstairs).All the participants were wearing a smartphone (Samsung Galaxy S II) on the waist during the experiment execution.
The data linked to from the course website represent data collected from the accelerometers and gyrometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It mainly contains - Train data (X_train, Y_train and subject_train), Test Data (X_test,Y_test and subject_test), Feature Vector and Activity Labels.

# Tidy Data

There are 68 variables in this data set (tidy-data.txt). Each row contains data related to 1 activity for a certain person.

Since, there are data for 30 persons or subjects, and each one performed 6 activities , so there are a total of 180 rows of data.

Each row contains data for 66 variables, each one being average of raw measurements for Activity - Subject combination.

SubjectId - Subject column is numbered sequentially from 1 to 30 as there are 30 volunteers.

ActivityType - It can be one of these values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

# Variables

The tidy data contains 68 variables (66 measurements and subjectId,activityType).

Variables can be identified based on their naming convention. Variables starting with t represent data related to "Time Domain". Variables starting with f represent data related to "Frequency Domain", which have been recorded after Fast Fourier Transform. The middle of the variable name suggests whether the data was taken from the accelerometer or from the gyroscope. Variables ending with "mean()" or "mean() - X/Y/Z" contains the mean value of the data or for its axis. Variables ending with "std()" or "std() - X/Y/Z" contains the standard deviation of the data or for its axis. 

1.	"subjectId" 
2.	"activityType" 
3.	"tBodyAcc-mean()-X" 
4.	"tBodyAcc-mean()-Y" 
5.	"tBodyAcc-mean()-Z" 
6.	"tGravityAcc-mean()-X"
7.	"tGravityAcc-mean()-Y"
8.	"tGravityAcc-mean()-Z" 
9.	"tBodyAccJerk-mean()-X"
10.	"tBodyAccJerk-mean()-Y"
11.	"tBodyAccJerk-mean()-Z"
12.	"tBodyGyro-mean()-X" 
13.	"tBodyGyro-mean()-Y" 
14.	"tBodyGyro-mean()-Z"
15.	"tBodyGyroJerk-mean()-X" 
16.	"tBodyGyroJerk-mean()-Y"
17.	"tBodyGyroJerk-mean()-Z"
18.	"tBodyAccMag-mean()" 
19.	"tGravityAccMag-mean()" 
20.	"tBodyAccJerkMag-mean()" 
21.	"tBodyGyroMag-mean()"
22.	"tBodyGyroJerkMag-mean()" 
23.	"fBodyAcc-mean()-X"
24.	"fBodyAcc-mean()-Y" 
25.	"fBodyAcc-mean()-Z" 
26.	"fBodyAccJerk-mean()-X" 
27.	"fBodyAccJerk-mean()-Y"
28.	"fBodyAccJerk-mean()-Z" 
29.	"fBodyGyro-mean()-X" 
30.	"fBodyGyro-mean()-Y" 
31.	"fBodyGyro-mean()-Z" 
32.	"fBodyAccMag-mean()"
33.	"fBodyBodyAccJerkMag-mean()"
34.	"fBodyBodyGyroMag-mean()" 
35.	"fBodyBodyGyroJerkMag-mean()" 
36.	"tBodyAcc-std()-X"
37.	"tBodyAcc-std()-Y" 
38.	"tBodyAcc-std()-Z"
39.	"tGravityAcc-std()-X"
40.	"tGravityAcc-std()-Y" 
41.	"tGravityAcc-std()-Z" 
42.	"tBodyAccJerk-std()-X"
43.	"tBodyAccJerk-std()-Y" 
44.	"tBodyAccJerk-std()-Z" 
45.	"tBodyGyro-std()-X"
46.	"tBodyGyro-std()-Y"
47.	"tBodyGyro-std()-Z"
48.	"tBodyGyroJerk-std()-X"
49.	"tBodyGyroJerk-std()-Y" 
50.	"tBodyGyroJerk-std()-Z"
51.	"tBodyAccMag-std()"
52.	"tGravityAccMag-std()" 
53.	"tBodyAccJerkMag-std()"
54.	"tBodyGyroMag-std()"
55.	"tBodyGyroJerkMag-std()" 
56.	"fBodyAcc-std()-X" 
57.	"fBodyAcc-std()-Y" 
58.	"fBodyAcc-std()-Z" 
59.	"fBodyAccJerk-std()-X" 
60.	"fBodyAccJerk-std()-Y"
61.	"fBodyAccJerk-std()-Z" 
62.	"fBodyGyro-std()-X" 
63.	"fBodyGyro-std()-Y" 
64.	"fBodyGyro-std()-Z" 
65.	"fBodyAccMag-std()" 
66.	"fBodyBodyAccJerkMag-std()" 
67.	"fBodyBodyGyroMag-std()" 
68.	"fBodyBodyGyroJerkMag-std()"


# Variable Units

The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2). 

The gyroscope units are rad/seg. 

In R script, ActivityType variable is factor type. SubjectId variable is integer type. All the other variables are numeric type.

# Transformations

The following transformations have been carried out on the source data to get the tidy data set -

1. Read Train data (X_train, Y_train and subject_train), Test Data (X_test,Y_test and subject_test), Feature Vector and Activity Labels.

2. Merge the training and the test sets to create one dataset.

	a) First, merge Train and Test data to create 3 datasets for X/'Accelerometer and Gyrometer measurements', Y/Activities and Subjects. The datasets created are X_total, Y_total and Sub_total.

	b) Assign column names.

	c) Merge X,Y and Sub data sets into one data set called merged_data.

3. Extract only the measurements on the mean and standard deviation for each measurement.

	a) Remove duplicate measurements so that dplyr function - select can execute properly.

	b) Select only the required columns (subjectId, activityId, and columns containing "mean" and "std").

4. Appropriately label the data set with descriptive variable names. (Already done in 2.b)

5. From the data set in step 4, create a second, independent tidy data set called "tidy-data.txt" with the average of each variable for each activity and each subject.

6. Print message - "Tidy dataset created."




