The Code Book contains information on making a tidy data set from the data contained in the 'Human Activity Recognition Using Smartphones Dataset' experiments.

STUDY DESIGN

  The study was done by:                      
    	Smartlab - Non Linear Complex Systems Laboratory									
    	DITEN - Università degli Studi di Genova.										
    	Via Opera Pia 11A, I-16145, Genoa, Italy.			
    	
Further information on the study can be found at the following website:                                                   
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones                                         
    The .zip file below also has a nice README document with full details
    
THE DATA																          

  The data was obtained from the following website:       	     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip		
  
  The data consisted of measurements (561) of different activity (6) on 30 subjects (divided into 2 sets - train and test).					
  There were 10299 rows of data in the data sets.
  
  The data was contained in:
  
    2 text files for the measurement data - 'test/X_test.txt', 'train/X_train.txt' (numeric)
    2 text files for the activity labels - 'test/y_test.txt', 'train/y_train.txt' (integer)
    2 text files for the subjects - 'test/subject_test.txt', 'train/subject_train.txt' (integer)
    1 text file that named the 561 measurements being record, 'features.txt' (text)

The purpose of this project is to merge the seven *.txt files, select certain measures, take the average for each Subject-Activity pair, and then label the new tidy data.frame.

The work was performed in a series of steps described below:

  1. Merge the test and train data sets.
  2. Select a subset of measurements from the data (measurements on mean() and std() only)
  3. Use descriptive names to label the activities: "Walking","Walking upstairs", "Walking downstairs", "Sitting", "Standing", "Laying"
  4. Use descriptive names to label the measurements,i.e. - "tBodyAcc-mean()-X", " tBodyAcc-std()-X", etc.
  5. Creates second, independent tidy data set with the average of each variable for each activity and each subject 
      This tidy data frame consisted of 66 measurements on 30 subjects for 6 activities, or a dim(180,66)
  
CODE BOOK

  Step 1.)
    testset - data set containing test subject measurement data
    trainset - data set containing train subject measurement data
    totalset - merge (rbind) of testset and trainset data
  
    testlabel - data set containing test subject integer
    trainlabel - data set containing train subject integer
    totallabel - merge (rbind) of testlabel and trainlabel data (integer)

  Step 2.)
  
    features - data set containing the text name for the measures 
    meanstdind - the indices for selecting only the mean() and std() measurements
    totalsetmnstd - the measurement data set with only the selected measuremenst
    
  Step 3.)

    totallabelact - the data set with the  activity indices 
    totalsetmnstdact - the measurement data set with the descriptive activity name column added

  Step 4.) 
  
    subjecttrain - the data set with the train subject 'names' (integers)
    subjecttest  - the data set with the test subject 'names' (integers)
    totalsubject - the data set of merged train and test subject 'names' 
    totalsetmnstdactsub - the data set of merged measurement data and subject 'names'

  Step 5.)
  
    tidydata - the tidy data set containing the average (mean) of the subject/activity for each of the 66 std() mean() measurements
    
  
