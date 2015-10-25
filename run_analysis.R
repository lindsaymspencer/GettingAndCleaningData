#####     Personal comments
####      Assignment instructions
###       What the next code block is doing
##        What the next code line is doing
#         Website where I found some help


### MAKE SURE REQUIRED PACKAGES AND LIBRARIES ARE INSTALLED

# http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them
list.of.packages <- c("dplyr", "assertthat", "lazyeval", "DBI", "BH", "tidyr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()
                                   [,"Package"])]
if(length(new.packages)) install.packages(new.packages)
rm("list.of.packages")
rm("new.packages")

library(dplyr)
library(tidyr)


#### You should create one R script called run_analysis.R that does the following. 

#### 1. Merges the training and the test sets to create one data set.

### GET COLUMN NAMES

features <- read.table("./UCI HAR Dataset/features.txt")


### MAKE THE COLUMN NAMES VALID COLUMN NAMES

## Remove "()" from the column names
# http://stackoverflow.com/questions/8364105/replace-with-in-r
a <- sapply(features[,2], function(x) gsub("()", '', x, fixed = T))
## Change "-"s into "."s in the column names
b <- sapply(a, function(x) gsub("-", '.', x, fixed = T))
## Make sure the names are valid
# http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name
valid_column_names <- make.names(b, unique=TRUE, allow_ = TRUE)


### CLEAN UP A LITTLE BIT

rm("features")
rm("a")
rm("b")


# GET TRAINING DATA

trainSubjectList <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(trainSubjectList) <- c("Subject")

trainTestLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(trainTestLabels) <- c("Activity")

trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(trainSet) <- valid_column_names

## Combine the training data
trainData <- cbind(trainSubjectList, trainTestLabels, trainSet)

## Make the training data a dplyr dataset
trainSet <- tbl_df(trainData)

## Add the training variable
trainSet <- mutate(trainSet, Set = "Train")


### CLEAN UP A LITTLE BIT

rm("trainData")
rm("trainSubjectList")
rm("trainTestLabels")


# GET TESTING DATA

testSubjectList <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(testSubjectList) <- c("Subject")

testTestLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(testTestLabels) <- c("Activity")

testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(testSet) <- valid_column_names

## Combine the testing data
testData <- cbind(testSubjectList, testTestLabels, testSet)

## Make the testing data a dplyr dataset
testSet <- tbl_df(testData)

## Add the testing variable
testSet <- mutate(testSet, Set = "Test")


### CLEAN UP A LITTLE BIT

rm("testData")
rm("testSubjectList")
rm("testTestLabels")
rm("valid_column_names")


# COMBINE DATASETS

data <- rbind(testSet, trainSet)


### CLEAN UP A LITTLE BIT

rm("testSet")
rm("trainSet")



#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# http://www.cheatography.com/davechild/cheat-sheets/regular-expressions/
# http://stackoverflow.com/questions/17906003/detecting-word-boundary-with-regex-in-data-frame-in-r
ad <- grep("Subject|Activity|Set|.mean\\b|.std\\b", colnames(data), fixed = FALSE)
data <- data[,ad]


### CLEAN UP A LITTLE BIT

rm("ad")


#### 3. Uses descriptive activity names to name the activities in the data set

## GET ACTIVITES

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## CHANGE THE ACTIVITY NUMBERS TO ACTIVITES 

# https://class.coursera.org/getdata-033/forum/thread?thread_id=183
data$Activity <- as.factor(activities$V2[data$Activity])


### CLEAN UP A LITTLE BIT

rm("activities")


#### 4. Appropriately labels the data set with descriptive variable names. 

## MAKE COLUMN NAMES LOWERCASE

colUmnNames <- tolower(colnames(data))

## REMOVE "."s FROM COLUMN NAMES

colnames(data) <- sapply(colUmnNames, function(x) gsub(".", '', x, fixed = T))


#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##### I had to add Set in because I included that in my combined data.
sum_data <- data %>% group_by(activity, subject, set) %>% summarise_each( funs(mean))


write.table(sum_data, "./final_data.txt", row.name=FALSE ) 


### CLEAN UP A LITTLE BIT

rm("colUmnNames")
