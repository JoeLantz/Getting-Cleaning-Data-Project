# Getting-Cleaning-Data-Project
This is my project submission for the Coursera 'Getting and Cleaning Data'
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

RUNNING THE SCRIPT

1. It is necessary to copy the file over to a './data/' folders that the 'run_analysis.R' script has access to.
2. The seven *.txt files from the are named in the Code Book markdown file.
	The train files should be located in:

		"./data/train/y_train.txt"  subject labels (Activity index)	                             			
		"./data/train/X_train.txt"  measurement data
		"./data/train/subject_train.txt' Subject name index
		
	The test files should be located in:	
	
		"./data/test/y_test.txt"    subject labels (Activity index)							
		"./data/test/X_test.txt"    measurement data
		"./data/test/subject_test.txt" Subject name index
		
	The description descriptive names of the values measured.								
    	The text file that names the 561 measurements being record:
    	
		"./data/features.txt" 

3. The analyst should copy the 'run_analysis.R' file to their Working Directory, with the './data' directory and files below.
4. The 'run_analysis.R' can be sourced to run all the steps at once.
5. Or, alternatively, the file could be opened and each step run individually.
6. The result is the tidy data data.frame, TidyData
7. A CodeBook.md markup file is included in this repo that describes the variables and other information (based on Getting and Cleaning Data video)


 
