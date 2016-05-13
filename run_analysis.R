# run_analysis.R
#C:\Users\Joe Lantz\Documents\Joe\Data Science Coursera\Class 3 - Getting and Cleaning Data\Course Project\getdata-projectfiles-UCI HAR Dataset.zip\UCI HAR Dataset

# Step 1a.) Merges the training and the test sets to create one data set (Sets)

testset  <- read.table("./data/test/X_test.txt")        # Load the test subject observations
trainset <- read.table("./data/train/X_train.txt")      # Load the train subject observations
totalset <- rbind(trainset,testset)                     # Merge the trainset and the testset
str(totalset)                                           # Show merge sets (10299 rows)

# Step 1b.) Merges the training and the test sets to create one data set. (Labels)

trainlabel <- read.table("./data/train/y_train.txt")    # Load the train subject labels - labels 1-6 - ...,"Sitting", "Standing", "Laying"
testlabel <- read.table("./data/test/y_test.txt")       # Load the test subject labels - labels 1-6 - "Walking", "Walking Upstairs", "Walking Downstairs"...
totallabel <- rbind(trainlabel,testlabel)               # Merge the trainlabel and the testlabel
str(totallabel)                                         # Show merged labels  (10299 rows)

# Step 2.) Extracts only the measurements on the mean and standard deviation for each measurement.
               
features <- read.table("./data/features.txt")                 # Extract the variables (measurements) 
MeanStdInd <- c(features$V1[grep("mean\\(\\)",features$V2)], 
                features$V1[grep("std\\(\\)",features$V2)])   # Get the indices of std() and mean()
MeanStdIndSrt <- sort(MeanStdInd)                             # Sort the indices
totalsetMnStd <- totalset[features$V1[MeanStdIndSrt]]         # Extract the mean() and std() from the merged dataset
str(totalsetMnStd)                                            # Show extracted mean() and std() measurements ( 66 rows)

# Step 3.) Uses descriptive activity names to name the activities in the data set

totallabelTxt <- totallabel                 # Add a Text column to the data set to contain descriptive activity names
totallabelTxt["Text"] <- totallabel$V1
totallabelTxt$Text[totallabelTxt$V1 == "1"] <- "WALKING"
totallabelTxt$Text[totallabelTxt$V1 == "2"] <- "WALKING UPSTAIRS"
totallabelTxt$Text[totallabelTxt$V1 == "3"] <- "WALKING DOWNSTAIRS"
totallabelTxt$Text[totallabelTxt$V1 == "4"] <- "sITTING"
totallabelTxt$Text[totallabelTxt$V1 == "5"] <- "STANDING"
totallabelTxt$Text[totallabelTxt$V1 == "6"] <- "LAYING"

totalsetMnStdAct <- totalsetMnStd
totalsetMnStdAct["Activity"] <- totallabelTxt$Text  # Load the new variable "Activity" with the type of activity
str(totalsetMnStdAct)                               # Show descriptive activity names (Added Activity column)

# Step 4. Appropriately labels the data set with descriptive variable names.

totalsetMnStdActLab <- totalsetMnStdAct
names(totalsetMnStdActLab) <- features$V2[MeanStdIndSrt] # Replace the the V1:V66 with the descriptive variable names
names(totalsetMnStdActLab)[67] <- "Activity"             # Replace the NA (missing from features df  with "Activity")
str(totalsetMnStdActLab)

# Step 5.) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

SubjectTrain <- read.table("./data/train/subject_train.txt")              # Get the Train Subjects
SubjectTest <- read.table("./data/test/subject_test.txt")                 # Get the Test Subjects
totalSubject <- rbind(SubjectTrain,SubjectTest)                           # merge with rbind the Subjects
totalsetMnStdActLabSub <- totalsetMnStdActLab
totalsetMnStdActLabSub["Subject"] <- totalSubject$V1  # Load the new variable "Subject " with the subject number
totalsetMnStdActLabSubIntact <- totalsetMnStdActLabSub
totalsetMnStdActLabSubIntact["Intact"]  <- totallabel$V1 # Attach the integer value to 
first <- TRUE
for (i in 1:30) {
        for (j in 1:6) {
                actsub <- (totalsetMnStdActLabSubIntact$Subject == i) &  # Build a variable of indices of 1 Subject, 1 Activity pairs
                          (totalsetMnStdActLabSubIntact$Intact == j)
                first1 <- TRUE
                for (k in 1:66) {  # For loop to concatenate the 
                        true2 <- TRUE
                        for (m in seq(which(actsub))) { # For loop to build a vector of Subject/Activity measurements
                                # print(totalsetMnStdActLabSubIntact[which(actsub)[m],k])
                                if (true2){
                                        sumactsub <- totalsetMnStdActLabSubIntact[which(actsub)[m],k]
                                        true2 <- FALSE
                                } else {sumactsub <- c(sumactsub, totalsetMnStdActLabSubIntact[which(actsub)[m],k])}
                        }
                        if (first1){
                                catmeasurement <- mean(sumactsub) # Take the mean of the Subject/Activity measurements
                                first1 <- FALSE
                        } else {catmeasurement <- c(catmeasurement, mean(sumactsub))} # Concatenate means for all 66 measurement types
                        #  print(catmeasurement)
                }  
                if(first){ 
                        first <- FALSE
                        TidyData <- data.frame()
                        TidyData <- catmeasurement
                } else {TidyData <- rbind(TidyData, catmeasurement)} # rbind the vector of measurement types to the TidyData data set
        }
}
TidyData <- data.frame(TidyData)  # Change the class of TidyData to a data.frame to add row and column names
colnames(TidyData) <- features$V2[MeanStdInd]   # Measurement type column names
ActivityTxt <- c("Walking", "Walking Upstairs","Walking downstairs", "Sitting", "Standing","Laying") # Activity names vector
RowNames <- vector()
for (i in 1:30) {  # For loop to build the Subject/Activity rownames for the TidyData data set
        for(j in 1:6) {
                RowNames <- c(RowNames, paste("Sub", i, ActivityTxt[j]))
        }
}
rownames(TidyData) <- RowNames  # Add the rownames to the TidyData data set
str(TidyData)                   # Show results
