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
