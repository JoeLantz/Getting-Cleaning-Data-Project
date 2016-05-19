str# run_analysis.R
#C:\Users\Joe Lantz\Documents\Joe\Data Science Coursera\Class 3 - Getting and Cleaning Data\Course Project\getdata-projectfiles-UCI HAR Dataset.zip\UCI HAR Dataset

# Step 1a.) Merges the training and the test sets to create one data set (Sets)

testset  <- read.table("./data/test/X_test.txt")        # Load the test subject observations
trainset <- read.table("./data/train/X_train.txt")      # Load the train subject observations
totalset <- rbind(trainset,testset)                     # Merge the trainset and the testset
#str(totalset)                                          # Show merge sets (10299 rows)

# Step 1b.) Merges the training and the test sets to create one data set. (Labels)

trainlabel <- read.table("./data/train/y_train.txt")    # Load the train subject labels - labels 1-6 - ...,"Sitting", "Standing", "Laying"
testlabel <- read.table("./data/test/y_test.txt")       # Load the test subject labels - labels 1-6 - "Walking", "Walking Upstairs", "Walking Downstairs"...
totallabel <- rbind(trainlabel,testlabel)               # Merge the trainlabel and the testlabel
#str(totallabel)                                        # Show merged labels  (10299 rows)


# Step 2.) Extracts only the measurements on the mean and standard deviation for each measurement.
               
features <- read.table("./data/features.txt")                 # Extract the variables (measurements) 
meanstdind <- c(features$V1[grep("mean\\(\\)",features$V2)], 
                features$V1[grep("std\\(\\)",features$V2)])   # Get the indices of std() and mean()
totalsetmnstd <- totalset[features$V1[meanstdind]]            # Extract the mean() and std() from the merged dataset
names(totalsetmnstd) <- features$V2[meanstdind]               # Replace the the column names with the descriptive variable names                  
#str(totalsetmnstd)                                           # Show extracted mean() and std() measurements ( 66 rows)

# Step 3.) Uses descriptive activity names to name the activities in the data set

totallabelact <- totallabel
names(totallabelact) <- "activity"  # Change the name of the activity column from 'V1' to 'activity'
totalsetmnstdact <- cbind(totallabelact, totalsetmnstd )  # Add a Text column to the data set to contain descriptive activity names

#---------------- Change integer index to descriptive text
totalsetmnstdact$activity[totalsetmnstdact$activity == "1"] <- "walking"
totalsetmnstdact$activity[totalsetmnstdact$activity == "2"] <- "walking upstairs"
totalsetmnstdact$activity[totalsetmnstdact$activity == "3"] <- "walking downstairs"
totalsetmnstdact$activity[totalsetmnstdact$activity == "4"] <- "sitting"
totalsetmnstdact$activity[totalsetmnstdact$activity == "5"] <- "standing"
totalsetmnstdact$activity[totalsetmnstdact$activity == "6"] <- "laying"
#str(totalsetmnstdact)                               # Show descriptive activity names (Added 'activity' column)

# Step 4. Appropriately labels the data set with descriptive variable names.

subjecttrain <- read.table("./data/train/subject_train.txt")   # Get the Train Subjects
subjecttest <- read.table("./data/test/subject_test.txt")      # Get the Test Subjects
totalsubject <- rbind(subjecttrain,subjecttest)                # merge with rbind the subjects
names(totalsubject) <- "subject"                               # Change the name of the Subject column from 'V1' to 'subject'          
totalsetmnstdactsub <- cbind(totalsubject, totalsetmnstdact )  # Add a Text column to the data set to contain 'subject' column
#str(totalsetmnstdactsub)

# Step 5.) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


library(dplyr)          # Load dplyr library to manipulate data.frame
packageVersion("dplyr") # Check to see if version >0.4.0

# Chaining operation: convert to dplyr data.frame; group by subject, activity; summarize each group and take the mean
# Creates a tidy data set of 180 subject/activity rows of 66 measurement types.

tidydata <- tbl_df(totalsetmnstdactsub) %>% group_by(subject, activity) %>% summarize_each(funs(mean)) 
View(tidydata)


