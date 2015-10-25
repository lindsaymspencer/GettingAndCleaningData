---
title: "Getting and Cleaning Data Course Project"
author: "Lindsay Spencer"
date: "Sunday, October 25, 2015"
output:
  html_document:
    keep_md: yes
---

## Project Description
This project looks at the mean and standard deviation for data collected from the accelerometers from the Samsung Galaxy S smartphone for 30 users.

##Study design and data processing

###Collection of the raw data
The data comes from the following website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Notes on the original (raw) data 
From the Center for Machine Learning and Intelligent Systems website:

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

##Creating the tidy datafile

###Guide to create the tidy data file
The original data exists in seven separate .txt files. 

First, the feature names were taken from the features.txt. 

Second, the names (e.g. 26 tBodyAcc-arCoeff()-X,1) were processed to take out the "()"s and the dashes ("-") were changed to periods (".") and they were made to ensure that they would be valid column names to simplify future steps. 

Third, the training subject list was read from subject_train.txt and the training test labels were read from y_train.txt. 

Fourth, the training data was read in from X_train.txt. 

Fifth, the data from steps 3 and 4 were combined to make the full training dataset and a variable was added (named Set) to labeled "Training" to identify the set. 
 
Sixth, steps 3, 4, and 5 were repeated with the test data using subject_test.txt, y_test.txt, and X_test.txt, respectfully, and labeled "Test" for the variable Set. 

Seventh, the training and test data sets were combined to create one dataset. 

Eighth, the variables for mean and standard deviation were extracted. Only the mean and std features were used because mean frequency and the vectors obtained from averaging the signals in a signal window sample are not the true mean.   

Ninth, the file activity_labels.txt were substituted for the test labels.

Tenth, the column labels for the data set were further updated to adhere to the instructor's guidelines to have variable names be all lowercase and not have periods. 

Finally, the data was written to the file final_data.txt.

##Description of the variables in the final_data.txt file
The final dataset has:
 - 180 observations x 69 
 - Summary of the data
 - The variables:
     activity
     subject
     set
     tbodyaccmeanx
     tbodyaccmeany
     tbodyaccmeanz
     tbodyaccstdx
     tbodyaccstdy
     tbodyaccstdz
     tgravityaccmeanx
     tgravityaccmeany
     tgravityaccmeanz
     tgravityaccstdx
     tgravityaccstdy
     tgravityaccstdz
     tbodyaccjerkmeanx
     tbodyaccjerkmeany
     tbodyaccjerkmeanz
     tbodyaccjerkstdx
     tbodyaccjerkstdy
     tbodyaccjerkstdz
     tbodygyromeanx
     tbodygyromeany
     tbodygyromeanz
     tbodygyrostdx
     tbodygyrostdy
     tbodygyrostdz
     tbodygyrojerkmeanx
     tbodygyrojerkmeany
     tbodygyrojerkmeanz
     tbodygyrojerkstdx
     tbodygyrojerkstdy
     tbodygyrojerkstdz
     tbodyaccmagmean
     tbodyaccmagstd
     tgravityaccmagmean
     tgravityaccmagstd
     tbodyaccjerkmagmean
     tbodyaccjerkmagstd
     tbodygyromagmean
     tbodygyromagstd
     tbodygyrojerkmagmean
     tbodygyrojerkmagstd
     fbodyaccmeanx
     fbodyaccmeany
     fbodyaccmeanz
     fbodyaccstdx
     fbodyaccstdy
     fbodyaccstdz
     fbodyaccjerkmeanx
     fbodyaccjerkmeany
     fbodyaccjerkmeanz
     fbodyaccjerkstdx
     fbodyaccjerkstdy
     fbodyaccjerkstdz
     fbodygyromeanx
     fbodygyromeany
     fbodygyromeanz
     fbodygyrostdx
     fbodygyrostdy
     fbodygyrostdz
     fbodyaccmagmean
     fbodyaccmagstd
     fbodybodyaccjerkmagmean
     fbodybodyaccjerkmagstd
     fbodybodygyromagmean
     fbodybodygyromagstd
     fbodybodygyrojerkmagmean
     fbodybodygyrojerkmagstd

###Variable 1: activity
The activity recorded. 

 - Character variable
 - Consisting of 
     WALKING
     WALKING_UPSTAIRS
     WALKING_DOWNSTAIRS
     SITTING
     STANDING
     LAYING
 - No unit of measurement 
 
###Variable 2: subject
The ID of the subject recorded.

 - Integer variable
 - Consisting of the numbers 1 - 30
 - No unit of measurement
 
###Variable 3: set
The original set of the data.

 - Character variable
 - Consisting of 
     Test
     Training 
 - No unit of measurement
 
###Variables 4-69
The average of the recorded data for each subject and activity.

 - Numeric variable
 - Consisting of the real numbers between [-1,1]
 - From the Center for Machine Learning and Intelligent Systems information: 
     
     Feature Selection 
     
     =================
     
     The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
     
     Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
     
     Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
     
     These signals were used to estimate variables of the feature vector for each pattern:  
     '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
     
     tBodyAcc-XYZ
     
     tGravityAcc-XYZ
     
     tBodyAccJerk-XYZ
     
     tBodyGyro-XYZ
     
     tBodyGyroJerk-XYZ
     
     tBodyAccMag
     
     tGravityAccMag
     
     tBodyAccJerkMag
     
     tBodyGyroMag
     
     tBodyGyroJerkMag
     
     fBodyAcc-XYZ
     
     fBodyAccJerk-XYZ
     
     fBodyGyro-XYZ
     
     fBodyAccMag
     
     fBodyAccJerkMag
     
     fBodyGyroMag
     
     fBodyGyroJerkMag
     
     
     
     The set of variables that were estimated from these signals are: 
     
     mean(): Mean value
     
     std(): Standard deviation
     

##Sources
http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
http://stackoverflow.com/questions/8364105/replace-with-in-r
http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name
http://www.cheatography.com/davechild/cheat-sheets/regular-expressions/
http://stackoverflow.com/questions/17906003/detecting-word-boundary-with-regex-in-data-frame-in-r
https://class.coursera.org/getdata-033/forum/thread?thread_id=183
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://gist.github.com/JorisSchut/dbc1fc0402f28cad9b41
